FROM ubuntu:24.04
LABEL key="sainsdata-itera"

# ========== USER & DEPENDENCIES ==========
RUN apt-get update && apt-get install -y sudo adduser wget curl nano vim tar net-tools rsync software-properties-common gnupg lsb-release openssh-server tree unzip

RUN adduser --disabled-password --gecos '' docker && adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER root

# ========== JAVA ==========
RUN add-apt-repository ppa:openjdk-r/ppa && apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64/ /usr/lib/jvm/java-1.8.0

# ========== PASSWORDLESS SSH ==========
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    chmod 755 /root && chmod 700 /root/.ssh && passwd --unlock root

# ========== INSTALL HADOOP ECOSYSTEM ==========
RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz && \
    tar -xvzf hadoop-3.4.1.tar.gz -C / && \
    ln -sf /hadoop-3.4.1 /hadoop

RUN wget https://downloads.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz && \
    tar -xvzf apache-hive-4.0.1-bin.tar.gz -C / && \
    ln -sf /apache-hive-4.0.1-bin /hive

RUN wget https://dlcdn.apache.org/tez/0.10.4/apache-tez-0.10.4-bin.tar.gz && \
    tar -xvzf apache-tez-0.10.4-bin.tar.gz -C / && \
    ln -sf /apache-tez-0.10.4-bin /tez

RUN wget https://archive.apache.org/dist/hbase/2.5.11/hbase-2.5.11-bin.tar.gz && \
    tar -xvzf hbase-2.5.11-bin.tar.gz -C / && \
    ln -sf /hbase-2.5.11-bin /hbase

RUN wget https://archive.apache.org/dist/zookeeper/zookeeper-3.8.4/apache-zookeeper-3.8.4-bin.tar.gz && \
    tar -xvzf apache-zookeeper-3.8.4-bin.tar.gz -C / && \
    ln -sf /apache-zookeeper-3.8.4-bin /zookeeper

RUN wget https://archive.apache.org/dist/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && \
    tar -xvzf spark-3.5.5-bin-hadoop3.tgz -C / && \
    ln -sf /spark-3.5.5-bin-hadoop3 /spark

# ========== INSTALL MYSQL ==========
RUN apt-get update && \
    echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get install -y mysql-server mysql-client

# ========== KONFIGURASI MYSQL ==========
RUN service mysql start && \
    mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;" && \
    mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS bigdata_stock;"

# ========== COPY DEPENDENSI TAMBAHAN ==========
COPY mysql-connector-java-8.0.28.jar /hive/lib/
COPY core-site.xml /conf/core-site.xml
COPY hdfs-site.xml /conf/hdfs-site.xml
COPY hadoop-env.sh /conf/hadoop-env.sh
COPY hive-site.xml /conf/hive-site.xml
COPY hbase-site.xml /conf/hbase-site.xml
COPY hbase-env.sh /conf/hbase-env.sh
COPY bootstrap.sh /bootstrap.sh
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

# ========== INSTALL PYTHON & PIP ==========
RUN apt-get update && apt-get install -y python3 python3-pip

# ========== INSTALL AIRFLOW ==========
ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW_VERSION=2.7.3
ENV PYTHON_VERSION=3.10

RUN pip3 install --upgrade pip && \
    pip3 install "apache-airflow==${AIRFLOW_VERSION}" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" && \
    pip3 install apache-airflow-providers-apache-spark apache-airflow-providers-apache-hadoop

# Create Airflow User and Directory
RUN adduser --disabled-password --gecos '' airflow && \
    mkdir -p ${AIRFLOW_HOME} && \
    chown -R airflow: ${AIRFLOW_HOME}

# Initialize Airflow database
USER airflow
RUN airflow db init

# Create Airflow admin user
RUN airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com \
    --password admin

USER root

# Create directories for DAGs and logs
RUN mkdir -p ${AIRFLOW_HOME}/dags && \
    mkdir -p ${AIRFLOW_HOME}/logs && \
    chown -R airflow: ${AIRFLOW_HOME}

# ========== USER & GROUP ==========
RUN addgroup hadoop && adduser --ingroup hadoop hadoop
RUN addgroup hive && adduser --ingroup hive hive
RUN usermod -a -G hadoop hive

# ========== EXPOSED PORTS ==========
EXPOSE 1004 1006 8020 9866 9867 9870 50470 9000 50070 9870
EXPOSE 8030 8031 8032 8033 8040 8041 8042 8088 10020 19888
EXPOSE 3306
EXPOSE 16000 16010 16020 16030
EXPOSE 2181 2888 3888
EXPOSE 4040
EXPOSE 8888
EXPOSE 8080

# ========== STARTUP ==========
RUN chmod +x /bootstrap.sh
CMD ["/bin/bash", "/bootstrap.sh"]
