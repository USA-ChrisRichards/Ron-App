import 'dart:async';
import 'package:meta/meta.dart';
import 'package:ron_app/repositories/quote_api_client.dart';
import 'package:ron_app/models/models.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<Quote> getQuote(String quote) async {
    // final String quote = await quoteApiClient.getRandomQuoteContent();
    return quoteApiClient.fetchQuote();
  }
}
