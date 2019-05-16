from behave import given, when, then
from banco.app import sacar, SaldoInsuficiente


@given(u'Dado que o cliente tenha em conta R$ "{saldo:d}"')
def step_impl(context, saldo):
    context.saldo = saldo


@when(u'ele for efetuado um saque de "{valor:d}"')
def step_impl(context, valor):
    try:
        context.saque = sacar(valor, context.saldo)
    except SaldoInsuficiente as e:
        context.exception = e


@then(u'Então a máquina deve retornar as notas "{notas:S}"')
def step_impl(context, notas):
    assert ",".join(map(str, context.saque)) == notas


@then(u"Deverá ser mostrado uma mensagem de erro")
def step_impl(context):
    assert type(context.exception) == SaldoInsuficiente
