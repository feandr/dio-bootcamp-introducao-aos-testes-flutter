import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCep {
  Future<Map<dynamic, dynamic>> retornaCEP(String cep) async {
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var retorno = await http.get(uri);
    var decodeResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodeResponse);
    return decodeResponse;
  }
}
