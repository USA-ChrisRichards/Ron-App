import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ron_app/blocs/blocs.dart';
import 'package:ron_app/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ron_app/simple_bloc_observer.dart';
import 'package:ron_app/widgets/widgets.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  //Bloc 5.0 remove BlocSupervisor

  final QuoteRepository quoteRepository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    App(
      quoteRepository: quoteRepository,
    ),
  );
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
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ron App'),
          backgroundColor: Colors.brown[600],
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: BlocProvider(
          create: (context) => QuoteBloc(quoteRepository: quoteRepository),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ron background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Quote(),
            ],
          ),
        ),
      ),
    );
  }
}
