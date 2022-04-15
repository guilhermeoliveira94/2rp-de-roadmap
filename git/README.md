# Git e GitHub

## Índice:
1. [Introdução](#introdução)
2. [Configurando o usuário](#configurando-o-usuário)
3. [Inicializando o repositório](#inicializando-o-repositório)
4. [Comandos](#comandos)
   - [Gerenciar Mudanças](#gerenciar-mudanças) 
   - [`$ git branch`](#git-branch)
   - [`$ git checkout`](#git-checkout)
   - [`$ git merge`](#git-merge)
   - [`$ git remote`](#git-remote)
   - [`$ git tag`](#git-tag)
6. [Material de estudos](#material-de-estudos)
   - [Documentação](#documentação)
   - [Vídeos](#vídeos)
   - [Cursos](#cursos)

# Introdução
O Git é um sistema de controle de versão distribuído e amplamente adotado. Seu criador principal é o mesmo que o do Linux: Linus Torvalds. GitHub é uma plataforma de hospedagem de código-fonte e arquivos com controle de versão usando o Git. Ele permite que programadores, utilitários ou qualquer usuário cadastrado na plataforma contribuam em projetos privados e/ou Open Source de qualquer lugar do mundo.

# Configurando o usuário
O Git usa um nome de usuário para associar os commits a uma identidade. O nome de usuário do Git é diferente do nome de usuário do GitHub.
Você pode alterar o nome associado aos commits do Git usando o comando `$ git config`. O novo nome configurado ficará visível em todos os commits futuros cujo push é feito para o GitHub usando a linha de comando.

## Configurando nome de usuário e email para todos os repositórios no computador
1. Abra o Git Bash.
2. Defina um nome de usuário do Git: 
~~~bash
$ git config --global user.name "seu_nome"
~~~
3. Configure seu email cadastrado no GitHub: 
~~~bash
$ git config --global user.email "seu_email_do_GitHub@(...)"
~~~

## Inicializando o repositório
Há duas maneiras de configurar uma pasta como um repositório git:
#### 1. Através de `$ git init`
1. Crie uma pasta vazia ou aproveite uma pasta já existente
2. Entre nela e inicialize o repositório com o comando: `$ git init`
3. Configure o endereço remoto do repositório:
   - Com https: 
   ~~~bash
   $ git remote add origin https://github.com/user/repo.git
   ~~~
   - Com ssh: 
   ~~~bash
   $ git remote add origin ssh:git@github.com/user/repo.git
   ~~~
   > Mais informações sobre o uso de `$ git remote` na seção [`$ git remote`](#git-remote)
4. Realize o _pull_: 
~~~bash
$ git pull origin master
~~~
### 2. Ou de `$ git clone`
1. Clone o repositório:
   - Com https: 
   ~~~bash
   $ git clone https://github.com/user/repo
   ~~~
   - Com ssh: 
   ~~~bash
   $ git clone ssh:git@github.com/user/repo.git
   ~~~
# Comandos
Para uma lista de comandos mais ampla para consulta: [@urielcaire/gitbasico](https://github.com/urielcaire/gitbasico)

## Gerenciar mudanças
 - Atualizar repositório local com as mudanças carregadas ao remoto: `$ git pull`
 - Verificar os arquivos que foram modificados, adicionados e removidos: `$ git status`
 - Verificar as mudanças feitas após o último _commit_: `$ git diff`
 - Incluir adição ou mudança a ser registrada: 
 ~~~bash
 $ git add <caminho/para/arquivos>
 ~~~
 - Incluir remoção de arquivo a ser registrada: 
 ~~~bash
 $ git rm <caminho/para/arquivos>
 ~~~
 - Registrar suas mudanças: 
 ~~~bash
 $ git commit -a -m "Mensagem"
 ~~~
As _flags_ são opcionais.

`-a` Adiciona automaticamente as mudanças realizadas nos arquivos que já estavam sendo rastreados nesse _commit_;<br />
`-m` Pula a etapa de abertura do editor de texto para a criação da mensagem de _commit_, utilizando diretamente a mensagem entre aspas;
 - Carregar as mudanças registradas ao repositório remoto: 
 ~~~bash
 $ git push origin <branch>
 ~~~
> é o _branch_ que está sendo modificado, como, por exemplo, o _master_.

> Para maiores explicações, veja a seção [Lidar com `$ git branch` e `$ git checkout`](#lidar-com-%24-git-branch-e-%24-git-checkout)
 - Verificar os _commits_ feitos em ordem cronológica: 
 ~~~bash
 $ git log [--oneline] [--graph]
 ~~~
>As flags são opcionais.<br />
>`--graph` mostra os _commits_ em estilo de grafo, com cada _branch_ de uma cor;<br />
>`--oneline` Deixa de lado algumas informações e mostra apenas o ID e o comentário do _commit_;<br />
>No quadrinho abaixo há uma representação parecida com resultado do uso das duas _flags_ acima.
- Ver informações sobre um _commit_: 
~~~bash
$ git show <ID do commit>
~~~

## `$ git branch`
_Branches_ são ramos de _commits_ que divergiram do "tronco" principal do repositório - ou até mesmo de outros _branches_. São muito úteis para o desenvolvimento paralelo de recursos, gerenciando mudanças de uma forma organizada, podendo ser integrados ao ramo principal quando estiverem prontos. O ramo azul no quadrinho acima é um exemplo de _branch_.
 - Listar o _branches_ existentes, indicando o atual: 
 ~~~bash
 $ git branch --all
 ~~~
> A flag é opcional.<br />
>`--all` Lista todos os _branches_ presentes no repositório local e no remoto;
 - Criar um novo _branch_ a partir do _commit_ atual: 
 ~~~bash
 $ git branch <nome>
 ~~~
- Deletar _branch_:
- Local: `$ git branch -d <nome>`
- Remoto: `$ git push origin --delete <nome>`

## `$ git checkout`
 - Mudar o _branch_ atual: 
 ~~~bash
 $ git checkout <nome>
 ~~~
> O par de comandos acima pode ser substituído por `$ git checkout -b <nome>`, caso deseje criar um novo _branch_ e fazer dele seu atual.

 
## `$ git merge`
Dada a forma que o git gerencia as mudanças nos arquivos, é relativamente fácil unir duas versões de um ou vários arquivos, em _branches_ separados, por exemplo. No quadrinho acima, o ramo azul foi fundido no ramo verde. O passo-a-passo abaixo instrui como realizar um _merge_ entre dois _branches_.
1. Mude para o _branch_ que receberá as mudanças: `$ git checkout <branch1>`
2. Realize o _merge_ de `<branch2>` em `<branch1>`: `$ git merge [--no-ff] <branch2>`
    > A flag é opcional.<br />
    > `--no-ff` Impede que os _commits_ de `<branch2>` sejam incorporados à árvore de `<branch1>`, apagando a existência de `<branch2>` do _log_ do repositório;<br />
    > Para mais informações, veja [differences between `git merge` and `git merge --no-ff`](http://stackoverflow.com/questions/9069061/what-is-the-difference-between-git-merge-and-git-merge-no-ff)
3. Resolva os possíveis conflitos, editando o que for necessário
4. Adicione, registre e carregue as mudanças no repositório remoto normalmente

## `$ git remote`
 - Listar os repositórios remotos registrados: `$ git remote show`
 - Verificar qual o endereço do repositório remoto: `$ git remote get-url <nome>`
 - Adicionar um novo repositório remoto:
   - Com https: `$ git remote add <nome> https://github.com/user/repo.git`
   - Com ssh: `$ git remote add <nome> ssh:git@github.com/user/repo.git`
 - Remover o endereço do repositório: `$ git remote remove origin`

## `$ git tag`

 - Listar todas as _tags_ do repositório local: `$ git tag [-nX]`
    > A _flag_ é opcional.<br />
    > `-nX` Mostra as X primeiras linhas da mensagem da _tag_ ou do _commit_ correspondente.
 - Criar uma _tag_ no _commit_ atual: `$ git tag <nome> [-a [-m "Mensagem"]]`
    > As _flags_ são opcionais.<br />
    > `-a` Cria uma flag _annotated_, isto é, uma _flag_ com informações sobre o usuário, a data e a hora de criação, assim como uma mensagem.<br />
    >`-m` Pula a etapa de abertura do editor de texto para a criação da mensagem, utilizando diretamente a mensagem entre aspas;
 - Ver informações de uma _tag_: `$ git show <nome>`
 - Carregar as _tags_ ao repositório remoto: `$ git push --tags`

# Material de estudos
## Documentação
## [Git Docs](https://git-scm.com/doc)
## [Git Manual Page](http://schacon.github.io/git/git.html)

## Vídeos
[Entendendo GIT | (não é um tutorial!)](https://www.youtube.com/watch?v=6Czd1Yetaac)

[Usando Git Direito | Limpando seus Commits!](https://www.youtube.com/watch?v=6OokP-NE49k)

## Cursos
[Git Completo: Do Básico ao Avançado](https://www.udemy.com/course/git-completo-do-basico-ao-avancado/)
