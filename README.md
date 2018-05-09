## The drink searcher

### Introduction

The Drink Searcher is a proejct for the SumOne Programming Challenge

`https://github.com/sumoners/sumone-dev-challenge`

### Requirements to run the project

The project is running on Ruby version `2.4.2`. The Rails version is `5.1.4`.

To create the database run the command:

`$ bundle exec rails db:create db:migrate db:seed`

*PS:* Don't forget to run `db:seed` as there are already a pre-set of drinks for testing.

#### Goal
Implement new functionalities to a search system of drinks recommendation.

#### Objetivos principais

* Implementar uma funcionalidade de recomendação de drink para o usuário utilizando os campos que existem no modelo de Drink, ou seja, permitir que o usuário informe as preferências dele em um formulário, e usar essas preferências para recomendar uma ou mais bebidas para ele. Fique a vontade para decidir como e quantas informações o usuário vai informar, e qual algoritmo vai ser utilizado para escolher a recomendação para o usuário.

#### Objetivos secundários

* Implementar um filtro simples por nome na tela inicial, trazendo os resultados ordenados por nome e adicionando paginação para mostrar somente 10 itens por página.

* Fazer ao menos testes unitários para serviços e métodos criados para a recomendação e a busca simples por nome, mas não se limitando, testes são sempre bem vindos.

#### Sugestões espertas ;)

* As buscas podem ser implementadas de maneira assíncrona via javascript, sem a necessidade de recarregar a página cada
vez que o usuário realizar uma busca.

* O campo de descrição do Drink também contém informações interessantes para realizar a recomendação de drink :)

* Utilizar alguma plataforma para fazer deploy e deixar o projeto rodando, podendo ser o heroku.

* Você pode utilizar algumas `gems` para o que julgar necessário. Mas o algoritmo de recomendação é de sua responsabilidade.

