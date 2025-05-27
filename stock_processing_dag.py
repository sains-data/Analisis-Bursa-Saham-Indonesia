from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 5, 27),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'stock_processing',
    default_args=default_args,
    description='Process stock data using Spark',
    schedule_interval='@daily',
)

# Check HDFS status
check_hdfs = BashOperator(
    task_id='check_hdfs_status',
    bash_command='hdfs dfsadmin -report',
    dag=dag,
)

# Spark job to process stock data
process_stock_data = SparkSubmitOperator(
    task_id='process_stock_data',
    application='${SPARK_HOME}/examples/src/main/python/pi.py',  # Replace with your actual Spark job
    name='stock_processing',
    conn_id='spark_default',
    verbose=True,
    dag=dag,
)

# Define the task dependencies
check_hdfs >> process_stock_data
