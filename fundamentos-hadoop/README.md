# Fundamentos Hadoop

## Índice
1. [Introdução](#introdução)
2. [HDFS](#hfds)
   - [Namenode](#namenode)
   - [Datanode](#datanode)
3. [Hue](#hue)
4. [YARN](#yarn)
5. [MapReduce](#mapreduce)
   - [Job Tracker](#job-tracker)
   - [Task Tracker](#task-tracker)
6. [Sentry](#sentry)
7. [Zookeeper](#zookeeper)
8. [Documentação](#documentação)

# Introdução
Hadoop é um ecossistema de ferramentas necessárias para processos em big data onde cada uma é responsável por uma tarefa diferente.
 
# HDFS
Hadoop Distributed File System é um sistema de dados distribuído voltado para o armazenamento de grande quantidade de arquivos.  É usado em clusters de servidores (junção de duas ou mais máquinas, que permitem maior disponibilidade e escalabilidade). O HDFS armazena todos os arquivos em blocos. O tamanho do bloco padrão é 64Mb. Todos os arquivos no HDFS possuem múltiplas réplicas, o que auxilia o processamento em paralelo. Não deve ser usado em aplicações que exigem acesso rápido a um registro, e sim em locais com grande volume de dados. Não deve ser utilizado para ler muitos arquivos pequenos.

### Tipos de nós
Os clusters HDFS possuem dois tipos de nós – primeiro um namenode, que é um admin, e múltiplos datanodes. Fora esses dois, também é possível ter namenodes secundários.

## Namenode
Administra o namespace do sistema de arquivos. Ele gerencia todos os arquivos e diretórios. Namenodes possuem o mapeamento entre arquivos e os blocos nos quais estes estão armazenados. Todos os arquivos são acessados usando esses namenodes e datanodes.
## Datanode
São blocos de comandos que geralmente recebem dados, fazem manipulações através das instruções e devolvem um resultado ou fazem alguma mudança no script.

# Hue
O Hue é uma interface de usuário da web que fornece vários serviços na estrutura do Hadoop baseada em Cloudera. Alguns dos principais recursos incluem o navegador de arquivos HDFS, editor Pig, editor Hive, navegador Job, shell Hadoop, permissões de administrador de usuário, editor Impala, interface da web Ozzie e acesso à API do Hadoop.

# YARN
Trata-se de uma plataforma de gerenciamento de recursos responsável pelo gerenciamento dos recursos computacionais em cluster, assim como pelo agendamento dos recursos. O YARN é um gerenciador de pacotes para aplicar comandos prontos ao código de uma aplicação. Considerado um sucessor mais eficaz e seguro que o NPM.

# MapReduce
MapReduce é um paradigma de programação em que cada tarefa é especificada em termos de funções de mapeamento e redução. Ambas as tarefas rodam paralelamente no cluster. O armazenamento necessário para essa funcionalidade é fornecido pelo HDFS. A seguir estão os principais componentes do MapReduce.

## Job Tracker
Tarefas de MapReduce são submetidas ao Job Tracker. Ele precisa falar com o Namenode para conseguir os dados. O Job Tracker submete a tarefa para os nós task trackers. Esses task tracker precisam se reportar ao Job Tracker em intervalos regulares, especificando que estão “vivos” e efetuando suas tarefas. Se o task tracker não se reportar a eles, então o nó é considerado “morto” e seu trabalho é redesignado para outro task tracker. O Job tracker é novamente um ponto crucial de falha. Se o Job Tracker falhar, não poderemos rastrear as tarefas.

## Task Tracker
O Task Tracker aceita as tarefas to Job Tracker. Essas tarefas são tanto de map, reduce ou ambas (shuffle). O Task Tracker cria um processo JVM separado para cada tarefa a fim de se certificar de que uma falha no processo não resulte em uma falha de Task Tracker. Task trackers também se reportam ao Job Tracker continuamente para que este possa manter o registro de tarefas bem ou mal sucedidas.

# Sentry
O Apache Sentry oferece um sistema de autorização granular baseada em função para os dados e metadados armazenados em um cluster do Hadoop. É o mecanismo que valida as solicitações de acesso.

# Zookeeper
É um serviço para fornecer informações de configuração, nomeação, sincronização e serviços de grupo em sistemas distribuídos, incluindo o Hadoop. A lógica do projeto é facilitar o gerenciamento de sistemas distribuídos, já que muitos aplicativos economizam nos serviços que tornam as mudanças de propagação confiáveis. O ZooKeeper usa um armazenamento de valores-chave de maneira hierárquica. É usado para ambientes de alta disponibilidade.


# Documentação
## [Apache Hadoop 3.3.2 Doc](https://hadoop.apache.org/docs/stable/)
## [Hue Guide](https://docs.gethue.com/)
## [Apache Sentry Tutorial](https://cwiki.apache.org/confluence/display/SENTRY/Sentry+Tutorial)
## [Apache Zookeeper - Documentation](https://zookeeper.apache.org/documentation.html)
