Feature: Saque no caixa eletronico
    Visando automizar o processo de saque
    Eu como analsita de negócios
    Quero permitir que os clientes saquem de forma automatizada.

    Scenario: Saque com valor menor que o saldo em conta
        Given Dado que o cliente possui R$ "510" em conta
        When Quando For feito um saque de R$ "260"
        Then Então as notas retornadas serão "100,100,50,10"

    Scenario: Saque com valor menor que o saldo em conta 2
        Given Dado que o cliente possui R$ "50" em conta
        When Quando For feito um saque de R$ "30"
        Then Então as notas retornadas serão "20,10"

    Scenario: Saque com valor menor que o saldo em conta 3
        Given Dado que o cliente possui R$ "200" em conta
        When Quando For feito um saque de R$ "180"
        Then Então as notas retornadas serão "100,50,20,10"

    Scenario: Saque com valor maior que o saldo em conta
        Given Dado que o cliente possui R$ "50" em conta
        When Quando For feito um saque de R$ "100"
        Then Então deverá ser mostrada a mensagem de saldo indisponível


    Scenario: Saque com valor menor que o saldo em conta - nao multiplo de 10
        Given Dado que o cliente possui R$ "50" em conta
        When Quando For feito um saque de R$ "35"
        Then Então deverá ser mostrada a mensagem de valor inválido