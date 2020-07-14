import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ron_app/widgets/widgets.dart';
import 'package:ron_app/blocs/blocs.dart';

class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ron App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_quote),
            onPressed: () async {
              final quote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuoteSelection(),
                ),
              );
              if (quote != null) {
                BlocProvider.of<QuoteBloc>(context).add(
                  QuoteRequested(quote: quote),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteInitial) {
              return Center(
                child: Text('press the icon for a random quote'),
              );
            }
            if (state is QuoteLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is QuoteLoadSuccess) {
              final quote = state.quote;
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: QuoteGenerated(quote: quote),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
