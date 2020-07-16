// Our QuoteBloc is very straightforward.
// To recap, it converts QuoteEvents into QuoteStates
// and has a dependency on the QuoteRepository
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:ron_app/repositories/repositories.dart';
import 'package:ron_app/models/models.dart';
import 'package:ron_app/blocs/blocs.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository quoteRepository;

  QuoteBloc({@required this.quoteRepository})
      : assert(quoteRepository != null),
        super(null);

  QuoteState get initialState => QuoteInitial();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is QuoteInitial) {
      yield QuoteLoadInProgress();
      try {
        final Quote quote = await quoteRepository.getQuote();
        yield QuoteLoadSuccess(quote: quote);
      } catch (_) {
        yield QuoteLoadFailure();
      }
    }
  }
}
