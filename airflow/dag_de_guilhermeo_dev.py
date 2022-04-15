from airflow import DAG 
from datetime import datetime, timedelta
from airflow.operators.dummy_operator import  DummyOperator
from custom_operators.tworp_spark_submit_operator import TwoRPSparkSubmitOperator
from airflow.operators.bash_operator import BashOperator

usuario='2rp-guilhermeo'
default_args = {
    'owner': usuario,
    'start_date': datetime(2020, 1, 1),
    'depend_on_past': False,
    'retries': 2,
    'retry_delay': timedelta(minutes=1),
    'run_as_user': usuario,
    'proxy_user': usuario
}

with DAG('de_guilherme_dev', schedule_interval=None, default_args=default_args, catchup=False, tags=["DATAENG"]) as dag:

    t_dummy = DummyOperator(
        task_id = "t_dummy"
    ) 
    
    t_kinit = BashOperator(
        task_id="t_kinit",
        bash_command=f'kinit -kt /home/{usuario}/{usuario}.keytab {usuario}'
    )

    t_executar_sh = BashOperator(
        task_id="t_executar_sh",
        bash_command=f'bash /home/{usuario}/shell-script/executar.sh /home/{usuario}/shell-script/arquivos-txt/ teste'
    )

    t_pokemons_oldschool = TwoRPSparkSubmitOperator(
        task_id="t_pokemons_oldschool",
        name="pokemons_oldschool",
        conn_id="spark_conn",
        application=f'/home/{usuario}/pokemons_oldschool_guilherme.py',
        keytab=f"/home/{usuario}/{usuario}.keytab",
        conf={'spark.yarn.queue':f'root.users.{usuario}', 'spark.driver.memory':'20g'},
        principal=usuario,
        proxy_user=None,
        verbose=True
    )

    t_dummy >> t_kinit >> t_executar_sh >> t_pokemons_oldschool
