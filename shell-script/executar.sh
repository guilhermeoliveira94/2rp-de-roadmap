#!/bin/bash

source ./funcoes.sh

lista_arquivos $1 $2

# Iterar pela array 
for caminho in "${caminho_dos_arquivos[@]}"; do
    insere_texto $caminho $2
done
