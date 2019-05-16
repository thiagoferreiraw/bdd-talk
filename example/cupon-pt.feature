Feature: Cupom de desconto
  Visando ter maior engajamento de clientes
  Como um analista de negócios
  Eu quero permitir que meus clientes usem cupons de desconto

  Scenario: Aplicar desconto fixo com valor de pedido acima do mínimo
    Given Dado que o usuário possui um pedido no total de R$ 51,00
    When Quando ele adicionar o cupom no pedido
      | cupom  | desconto | valor_minimo |
      | DESC20 | 20       | 50           |
    Then Então o desconto concedido será de R$ 20,00

  Scenario: Aplicar desconto fixo com valor de pedido abaixo do mínimo
    Given Dado que o usuário possui um pedido no total de R$ 49,00
    When Quando ele adicionar o cupom no pedido
      | cupom  | desconto | valor_minimo |
      | DESC20 | 20       | 50           |
    Then Deverá ser mostrado a mensagem "Pedido não atinge o valor mínimo"

#   Scenario: Apply percentage discount coupon above maximum discount
#     Given the user has an open cart with the total of $50
#      When he adds the coupon to the cart
#      Then the final discount should be $5

# Scenario: Apply fixed discount coupon below minumum order value
#     Given the user has an open cart with the total of $50
#      When he adds the coupon to the cart
#      Then the user should not be able to add this coupon

#   Scenario: Apply fixed discount coupon above minumum order value
#     Given the user has an open cart with the total of $50
#      When he adds the coupon to the cart
#      Then the user should not be able to add this coupon

