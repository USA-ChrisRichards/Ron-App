import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ron_app/blocs/blocs.dart';
import 'package:ron_app/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ron_app/widgets/widgets.dart';

void main() {
  final QuoteRepository quoteRepository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(quoteRepository: quoteRepository));
}

class App extends StatelessWidget {
  final QuoteRepository quoteRepository;

  App({Key key, @required this.quoteRepository})
      : assert(quoteRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ron App',
      home: BlocProvider(
        create: (context) => QuoteBloc(quoteRepository: quoteRepository),
        child: Quote(),
      ),
    );
  }
}
