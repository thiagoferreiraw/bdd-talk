Feature: Saque no caixa eletronico
    Visando automatizar o processo de saque no banco
    Como um analista de negócios
    Eu quero permitir que meus clientes saquem notas pelo caixa eletrônico

    Scenario: Sacar valor menor que o saldo em conta - 1
        Given Dado que um cliente no banco possui R$ "950" de saldo
        When Quando for feito um saque de R$ "160"
        Then Então as notas retornadas deverão ser: "100,50,10"

    Scenario: Sacar valor menor que o saldo em conta - 2
        Given Dado que um cliente no banco possui R$ "900" de saldo
        When Quando for feito um saque de R$ "290"
        Then Então as notas retornadas deverão ser: "100,100,50,20,20"

    Scenario: Sacar valor menor que o saldo em conta - 3
        Given Dado que um cliente no banco possui R$ "900" de saldo
        When Quando for feito um saque de R$ "10"
        Then Então as notas retornadas deverão ser: "10"

    Scenario: Sacar valor maior que o saldo em conta
        Given Dado que um cliente no banco possui R$ "15" de saldo
        When Quando for feito um saque de R$ "50"
        Then Então deverá ser mostrado a mensagem de saldo indisponível

    Scenario: Sacar valor inválido
        Given Dado que um cliente no banco possui R$ "100" de saldo
        When Quando for feito um saque de R$ "13"
        Then Então deverá ser mostrado a mensagem de valor inválido