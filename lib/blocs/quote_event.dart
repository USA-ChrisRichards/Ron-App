import 'package:equatable/equatable.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();
}

class QuoteRequested extends QuoteEvent {
  const QuoteRequested();
  @override
  List<Object> get props => [];
}
