import 'package:equatable/equatable.dart';
import 'package:ron_app/models/quote.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();
}

class QuoteRequested extends QuoteEvent {
  final Quote quote;

  const QuoteRequested({this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}
