# -*- coding: utf-8 -*-

from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()

# Criar dataframes com os dados das tabelas 
df_pokemon = spark.table("work_dataeng.pokemon_guilherme")
df_generation = spark.table("work_dataeng.generation_oliveira")
df_generation = df_generation.filter(df_generation["date_introduced"] < "2002-11-21")  # Filtro por data

# Cache do df_generation
df_generation = df_generation.cache()

# Inner join entre os dataframes pokemon e generation (necessario alterar o nome da coluna para nao duplicar)
df_pokemon = df_pokemon.withColumnRenamed('generation', 'generation_pokemons')
pokemon_generation_join = df_pokemon.join(df_generation, on=[df_pokemon.generation_pokemons == df_generation.generation], how='inner')
pokemon_generation_join = pokemon_generation_join.drop('generation_pokemons')  # Apos o inner join, removendo a coluna duplicada

# Salvar o df em uma nova tabela no Hive
pokemon_generation_join.write.mode('overwrite').format('orc').saveAsTable('work_dataeng.pokemons_oldschool_guilherme')
