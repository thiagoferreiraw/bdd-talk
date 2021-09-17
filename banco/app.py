#!/usr/bin/env python

import unittest

notas_disponiveis = [200, 100, 50, 20, 10]


class SaldoInsuficiente(Exception):
    pass


class ValorInvalido(Exception):
    pass


def sacar(valor, saldo):
    if valor > saldo:
        raise SaldoInsuficiente()

    if valor <= 0:
        raise ValorInvalido()

    if valor % 10 > 0:
        raise ValorInvalido()

    saque = []
    for nota in notas_disponiveis:
        while valor:
            if valor >= nota:
                valor -= nota
                saque.append(nota)
            else:
                break

    return saque


class ProgramaTestCase(unittest.TestCase):
    def test_multiplo_10(self):
        with self.assertRaises(ValorInvalido):
            self.assertEqual(sacar(105, 9999), None)

    def test_sacar100(self):
        self.assertEqual(sacar(100, 9999), [100])

    def test_sacar200(self):
        self.assertEqual(sacar(200, 9999), [100, 100])

    def test_sacar150(self):
        self.assertEqual(sacar(150, 9999), [100, 50])

    def test_sacar160(self):
        self.assertEqual(sacar(160, 9999), [100, 50, 10])

    def test_sacar180(self):
        self.assertEqual(sacar(180, 9999), [100, 50, 20, 10])

    def test_sacar310(self):
        self.assertEqual(sacar(310, 9999), [100, 100, 100, 10])

    def test_sacar_bdd(self):
        # Contexto
        saldo = 9999
        valor = 310
        print("\n\nDado que o usuário tenha {} de saldo em conta".format(saldo))

        # Ação
        print("Quando for feito um saque de {}".format(valor))
        notas = sacar(valor, saldo)

        # Resultado
        self.assertEqual(notas, [100, 100, 100, 10])
        print("Então as notas emitidas serão {}\n".format([100, 100, 100, 10]))

    def test_menos100(self):
        with self.assertRaises(ValorInvalido):
            sacar(-100, 9999)

    def test_saldo_insuficiente(self):
        with self.assertRaises(SaldoInsuficiente):
            sacar(100, 50)


if __name__ == "__main__":
    unittest.main()
