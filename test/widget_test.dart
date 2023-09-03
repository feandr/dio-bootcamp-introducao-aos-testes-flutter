import 'package:flutter_intro_testes/classes/viacep.dart';
import 'package:flutter_intro_testes/meu_app_testes.dart' as app;

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MockViaCep])
void main() {
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
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values['desconto'].toString()),
                values['percentual'] == true),
            throwsA(const TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversão para uppercase', () {
    expect(app.convertToUperCase("dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase 2', () {
    expect(app.convertToUperCase("dio"), equalsIgnoringCase("dio"));
  });

  test('Testar double', () {
    expect(app.retornaValor(50.0), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(app.convertToUperCase("dio"), startsWith("D"));
  });

  test('Retorna Cep', () async {

    var body = await viaCep.retornaCEP("08830490");
    expect(body["bairro"], equals("Jardim das Bandeiras"));
  });
}

class MockViaCep extends Mock implements ViaCep{

}