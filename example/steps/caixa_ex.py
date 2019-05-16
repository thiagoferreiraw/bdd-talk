from behave import given, when, then

# from hamcrest import *
from example.programa import sacar, SaldoInsuficiente, ValorInvalido


@given(u'Dado que um cliente no banco possui R$ "{saldo:d}" de saldo')
def step_impl1(context, saldo):
    context.saldo = saldo


@when(u'Quando for feito um saque de R$ "{valor:d}"')
def step_impl2(context, valor):
    try:
        context.saque = sacar(valor, context.saldo)
    except (SaldoInsuficiente, ValorInvalido) as e:
        context.exception = e


@then(u'Então as notas retornadas deverão ser: "{notas:S}"')
def step_impl3(context, notas):
    assert ",".join(map(str, context.saque)) == notas


@then(u"Então deverá ser mostrado a mensagem de saldo indisponível")
def step_impl4(context):
    assert type(context.exception) == SaldoInsuficiente


@then(u"Então deverá ser mostrado a mensagem de valor inválido")
def step_impl5(context):
    assert type(context.exception) == ValorInvalido
