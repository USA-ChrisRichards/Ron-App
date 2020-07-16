import 'dart:convert';
import '../models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
// http: composable Future-based library for making HTTP requests

class QuoteApiClient {
  static const baseUrl = 'http://ron-swanson-quotes.herokuapp.com/v2/';
  final http.Client httpClient;

  QuoteApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Quote> fetchQuote() async {
    final quoteResponse = await this.httpClient.get('$baseUrl/quotes');
    if (quoteResponse.statusCode != 200) {
      throw Exception('error getting quote content in fetchQuote');
    }
    final quoteJson = jsonDecode(quoteResponse.body);
    return Quote.fromJson(quoteJson);
    //* quoteJson is a String
  }
}
