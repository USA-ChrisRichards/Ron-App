import 'dart:convert';
import '../models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
// http: composable Future-based library for making HTTP requests

class QuoteApiClient {
  static const baseUrl = 'http://ron-swanson-quotes.herokuapp.com/v2/';
  final http.Client httpClient;

  QuoteApiClient({@required this.httpClient}) : assert(httpClient != null);

  // Future<String> getRandomQuoteContent() async {
  //   final quoteUrl = '$baseUrl/quotes';
  //   final quoteResponse = await this.httpClient.get(quoteUrl);
  //   if (quoteResponse.statusCode != 200) {
  //     throw Exception('error getting random quote content');
  //   }
  //   final quoteJson = jsonDecode(quoteResponse.body) as List;
  //   return (quoteJson.first)['woeid'];
  // }
  //* Above method could prove helpful for search quote feature,
  //* but for now we are just getting random quote from API

  Future<Quote> fetchQuote() async {
    final quoteUrl = '$baseUrl/quotes';
    final quoteResponse = await this.httpClient.get(quoteUrl);
    if (quoteResponse.statusCode != 200) {
      throw Exception('error getting quote content in fetchQuote');
    }
    final quoteJson = jsonDecode(quoteResponse.body);
    return Quote.fromJson(quoteJson);
  }
}
