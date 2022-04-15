#!/bin/bash
:<<'BLOCO_DE_COMENTARIOS'

# Comentário Simples

# Variável
OLA='Olá, mundo!'
echo $OLA

# Array
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo ${MUNDO[0]}

# Para rodar todos os elementos da Array
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo ${MUNDO[@]}

# Para retornaro número total de elementos da Array
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo ${#MUNDO[@]}

# Para rodar a partir do segundo elemento
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo ${MUNDO[*]:1}

# Funções
funcao(){
   # Instruções
}

# Imrpimindo uma função
minhafuncao(){
   echo "Essa é minha função"
}

minhafuncao

# Enviando variáveis para a função
minhafuncao(){
   echo "Eu escrevo em $2 $1."
}

minhafuncao $1 $2

# Imprimir todos os parâmetros enviados
# Pode-se também usar $# para retornar o número de parâmetros enviados, $? para informar se houve erro ou não, 
# ou $1 $2(...) para retornar parâmetros específicos

minhafuncao(){
   echo "Todos os parâmetros: $@"
}

minhafuncao $@ 

# Declarando uma variável constante (valor não pode ser alterado)

declare -r MinhaConstante='Isso é uma constante'
echo $MinhaConstante

# Criar uma array com todos os file/dir entro de ~/meu_diretorio
arr=(~/Documents/Projetos/shell-script/*)

# Iterar pela array usando um contador
for f in "${arr[@]}"; do
    echo "$f"
done

# Condições (checar os tests existentes na documentação)

minhaFuncao(){
    VARIAVEL=$1;
    if test "$VARIAVEL" -gt 10 # -gt = GreaterThan
        then
            echo 'É maior que 10'
    elif test "$VARIAVEL" -eq 10 # -eq = EQual
        then  
            echo 'É igual a 10'
    else
        echo 'É menor que 10'
    fi
}

minhaFuncao $1

# Case

minhaFuncao(){
    case $1 in
        10) echo "é 10";;
        9) echo "é 9";;
        7|8) echo "é 7 ou 8";;
        *) echo "é menor que 6 ou maior que 10";;
    esac
}

minhaFuncao $1

# Para ler informação usa a função read

read input_string

echo "A palavra digitada foi $input_string"

# Para criar um arquivo
touch lista.txt

# Para Escrever em um txt (irá apagar o conteúdo antigo)
echo "Esse conteúdo" > lista.txt

# Para Acrescentar a um txt (irá acrescentar ao final do documento)
echo "Outro Conteúdo" >> lista.txt

cat lista.txt

BLOCO_DE_COMENTARIOS
