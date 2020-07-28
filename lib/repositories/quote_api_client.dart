import 'dart:convert';
import 'package:ron_app/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
// http: composable Future-based library for making HTTP requests

class QuoteApiClient {
  final http.Client httpClient;

  QuoteApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Quote> fetchQuote() async {
    final _baseUrl = 'http://ron-swanson-quotes.herokuapp.com/v2/quotes';
    final response = await this.httpClient.get('$_baseUrl');

    if (response.statusCode != 200) {
      throw Exception('error getting quote content in fetchQuote');
    }

    final json = jsonDecode(response.body);
    return Quote.fromJson(json);
    //* quoteJson is a String
  }
}
