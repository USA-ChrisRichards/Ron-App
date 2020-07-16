import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ron_app/repositories/repositories.dart';
import 'package:ron_app/blocs/blocs.dart';

class Quote extends StatelessWidget {
  final QuoteRepository quoteRepository;

  const Quote({Key key, this.quoteRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is QuoteInitial) {
            return Center(
              child: Text('state is quoteInitial'),
            );
          }
          if (state is QuoteLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is QuoteLoadSuccess) {
            return Column(
              children: [
                Text('state is QuoteLoadSuccess'),
                IconButton(
                  icon: Icon(Icons.format_quote),
                  onPressed: () async {
                    final quote = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Text('quote'),
                      ),
                    );
                    if (quote != null) {
                      BlocProvider.of<QuoteBloc>(context).add(
                        QuoteRequested(quote: quote),
                      );
                    }
                  },
                ),
              ],
            );
          }
          return Text('state = $state / quote repo = $quoteRepository');
        },
      ),
    );
  }
}
