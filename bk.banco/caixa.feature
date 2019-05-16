Feature: Saque no caixa eletronico
    Visando automizar o processo de saque
    Eu como analsita de negócios
    Quero permitir que os clientes saquem de forma automatizada.


    Scenario: Sacar um valor abaixo do saldo em conta
        Given Dado que o cliente tenha em conta R$ "800"
        When ele for efetuado um saque de "450"
        Then Então a máquina deve retornar as notas "100,100,100,100,50"

    Scenario: Sacar um valor abaixo do saldo em conta 2
        Given Dado que o cliente tenha em conta R$ "900"
        When ele for efetuado um saque de "120"
        Then Então a máquina deve retornar as notas "100,20"

    Scenario: Sacar um valor acima do saldo em onta
        Given Dado que o cliente tenha em conta R$ "5"
        When ele for efetuado um saque de "160"
        Then Deverá ser mostrado uma mensagem de erro