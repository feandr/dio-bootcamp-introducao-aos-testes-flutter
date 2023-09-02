import 'package:flutter_intro_testes/meu_app_testes.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
test('Calcula o valor do produto com desconto sem porcentagem', () {
expect(app.calcularDesconto(1000, 150, false), 850);
});

test('Calcula o valor do produto com desconto com porcentagem', () {
expect(app.calcularDesconto(1000, 15, true), 850);

});

test('Calcula o valor do produto zerado/Error', () {
expect(() => 
app.calcularDesconto(0, 150, false), 
throwsA(const TypeMatcher<ArgumentError>()));
});

test('Calcula o valor do desconto zerado/Error', () {
expect(() => 
app.calcularDesconto(1000, 0, true), 
throwsA(const TypeMatcher<ArgumentError>()));
});
}
