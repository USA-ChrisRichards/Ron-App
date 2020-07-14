import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ron_app/models/models.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteLoadInProgress extends QuoteState {}

class QuoteLoadSuccess extends QuoteState {
  final Quote quote;

  const QuoteLoadSuccess({@required this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}

class WeatherLoadFailure extends QuoteState {}
