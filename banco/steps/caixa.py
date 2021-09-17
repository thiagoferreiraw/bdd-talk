from behave import given, when, then
from banco.app import sacar, SaldoInsuficiente, ValorInvalido


@given(u'Dado que o cliente possui R$ "{saldo:d}" em conta')
def step_impl(context, saldo):
    context.saldo = saldo


@when(u'Quando For feito um saque de R$ "{valor:d}"')
def step_impl(context, valor):
    try:
        context.notas = sacar(valor, context.saldo)
    except (SaldoInsuficiente, ValorInvalido) as e:
        context.exception = e


@then(u'Então as notas retornadas serão "{notas:S}"')
def step_impl(context, notas):
    assert ",".join(map(str, context.notas)) == notas, context.notas


@then(u"Então deverá ser mostrada a mensagem de saldo indisponível")
def step_impl(context):
    assert type(context.exception) == SaldoInsuficiente


@then(u"Então deverá ser mostrada a mensagem de valor inválido")
def step_impl(context):
    assert type(context.exception) == ValorInvalido

