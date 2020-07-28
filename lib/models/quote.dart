import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String quote;

  const Quote({this.quote});

  @override
  List<Object> get props => [quote];

  static Quote fromJson(dynamic json) {
    return Quote(
      quote: json[0],
    );
  }

  @override
  String toString() => 'Quote { quote: $quote }';
}
