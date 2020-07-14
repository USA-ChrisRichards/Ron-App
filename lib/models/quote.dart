import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String content;

  const Quote({this.content});

  @override
  List<Object> get props => [content];

  static Quote fromJson(dynamic json) {
    return Quote(content: _mapStringToContent(json));
  }

  static _mapStringToContent(String input) {
    if (input is String) {
      return input;
    } else {
      return '404 error, API call failed';
    }
  }
}
