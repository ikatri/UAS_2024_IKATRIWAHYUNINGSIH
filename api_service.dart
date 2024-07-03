import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto_model.dart';

class ApiService {
  static const String apiUrl = 'https://api.coinlore.net/api/tickers/';

  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> cryptoList = data['data'];
      return cryptoList.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
