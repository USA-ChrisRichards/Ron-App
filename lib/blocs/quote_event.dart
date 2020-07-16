import 'package:equatable/equatable.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();
}

class QuoteRequested extends QuoteEvent {
  final String quote;

  const QuoteRequested({this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}
