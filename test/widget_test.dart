import 'package:flutter_intro_testes/meu_app_testes.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Calcula o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  group("Calcular com desconto", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('$values: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values['desconto'].toString()),
                values['percentual'] == true),
            equals(expected));
      });
    });
  });

    group("Calcular com desconto/Error", () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values: ', () {
        expect(() =>
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values['desconto'].toString()),
                values['percentual'] == true),
            throwsA(const TypeMatcher<ArgumentError>()));
      });
    }
  });
}
