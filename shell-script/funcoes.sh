#!/bin/bash

lista_arquivos(){
    # Criar uma array com todos os caminhos dos arquivos .txt dentro de $1 e subpastas
    # incluirá arquivos com espaço nulo no nome
    caminho_dos_arquivos=()
    mapfile -d '' caminho_dos_arquivos < <(find $1 -name '*.txt' -print0 2>/dev/null) 
}

insere_texto(){
    echo $2 >> $1
}
