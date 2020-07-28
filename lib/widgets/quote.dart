import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ron_app/blocs/blocs.dart';

class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteLoadFailure) {
          return Column(
            children: [
              Text('failed to fetch quote'),
            ],
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
              Text('state is QuoteLoadSuccess ${state.quote}'),
            ],
          );
        }
        return RaisedButton(
            onPressed: () {
              BlocProvider.of<QuoteBloc>(context).add(QuoteRequested());
            },
            child: Text('Get Quote, state= $state'));
      },
    );
  }
}
