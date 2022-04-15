# Bash/Shell Script

## Índice
1. [Introdução](#introdução)
2. [Variáveis e Arrays](#variáveis-e-arrays)
   - [Variável](#variável)
   - [Array](#array)
3. [Funções](#funções)
4. [Condições](#condições)
   - [if else](#if-else)
   - [case](#case)
5. [Laços de Repetição](#laços-de-repetição)
   - [for](#for)
   - [while](#while)
5. [Comandos](#comandos)
   - [Shebang](#shebang)
   - [Transformar o arquivo em executável](#transformar-o-arquivo-em-executável)
   - [Write e Append](#write-e-append)
6. [Material de estudos](#material-de-estudos)
   - [Documentação](#documentação)
   - [Vídeos](#vídeos)
   - [Cursos](#cursos)

# Introdução
Shell é um interpretador de comandos que fica entre o usuário e o kernel, tem por objetivo automatizar algumas tarefas do dia a dia de um _sysadmin_. O interpretador de comando que usaremos será o Bash que é um acrônimo para _bourne again shell_.
 
# Variáveis e Arrays
## `Variável`
Forma de atribuir valor e imprimir variável. Ao definir valor a uma variável, não se deve adicionar espaço após o sinal de igual.
~~~bash
OLA='Olá, mundo!'
echo $OLA
~~~
Você também pode checar as variáveis de ambiente digitando o comando: 
~~~bash 
env 
~~~
## `Array`
É uma lista que contém um conjunto de variáveis.
~~~bash
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo $MUNDO[0]
# Shell Script
~~~
Você pode imprimir todos os elementos de uma Array utilizando o formato:
~~~bash
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo $MUNDO[*]
# Shell Script Bash GNU Linux Debian
~~~
E para retornar o número total de elementos de uma Array:
~~~bash
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo $#MUNDO[@] 
# 5
~~~
Para rodar a partir do segundo elemento:
~~~bash
MUNDO=('Shell Script' 'Bash' 'GNU' 'Linux' 'Debian')
echo ${MUNDO[*]:1}
# Bash GNU Linux Debian
~~~
# Funções
São blocos de comandos que geralmente recebem dados, fazem manipulações através das instruções e devolvem um resultado ou fazem alguma mudança no script.
~~~bash
funcao(){
   # Instruções
}
~~~
Para executar uma função, basta repetir o nome da mesma:
~~~bash
minhafuncao(){
   echo "Essa é minha função"
}

minhafuncao
~~~
# Condições
Útil para fazer verificações em textos e arquivos, testa o conteúdo de uma variável comparando valores, numéricos ou não. Em caso de verificação booleana, ele retornará 0 para positivo, 1 para negativo, e 2 para erro.
~~~bash
test 1 = 1;
echo $?
~~~
Também pode ser escrito da seguinte forma (atentar para o espaço entre os [[ ]] pois eles são obrigatórios):
~~~bash
[[ 1 = 1 ]] ;
echo $?
~~~

## `if else`
~~~bash
read VARIAVEL
if  [[ "$VARIAVEL" > 10 ]] # -gt = GreaterThan
   then
      echo 'É maior que 10'
elif [[ "$VARIAVEL" = 10 ]] # -eq = EQual
   then  
      echo 'É igual a 10'
else
   echo 'É menor que 10'
fi
~~~
## `case`
~~~bash
read VARIAVEL
case $VARIAVEL in
   10) echo "é 10";;
   9) echo "é 9";;
   7|8) echo "é 7 ou 8";;
   *) echo "é menor que 6 ou maior que 10";;
esac
~~~
# Laços de Repetição
## `for`
~~~bash
for i in {2..8}
do
   echo $i
done
~~~
## `while` 
~~~bash
contador=0;
while [ $contador -lt 10 ]; do # -lt significa a "Less Than"
   echo O valor de contador é $contador 
   (( contador = contador + 1))
done
~~~

# Comandos

## `Shebang`
É cabeçalho e o caminho do interpretador Shell. Todo arquivo .sh deve conter esses comandos em sua primeira linha para poder ser executado. O caminho pode variar de acordo com o interpretador que será utilizado.
~~~bash
#!/bin/bash
~~~

## `Transformar o arquivo em executável`
Caso receba erro de autorização negada quando tentar executar o arquivo .sh, tente antes rodar o comando a seguir:
~~~bash
chmod +x meuscript.sh
~~~

## `Write e Append`
Você pode escrever em um arquivo .txt usando o comando (irá apagar o conteúdo antigo):
~~~bash
echo "Conteúdo a ser escrito" > documento.txt
~~~
Você pode também acrescentar ao final de um arquivo .txt (irá manter o conteúdo antigo)
~~~bash
echo "Conteúdo a ser acrescentado" >> documento.txt
~~~

# Material de estudos

## Documentação
## [Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html)

## Cursos
[Curso de Shell Script do Iniciante ao Avançado](https://www.udemy.com/course/curso-de-shell-script-do-iniciante-ao-avancado/)
