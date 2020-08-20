import 'dart:html';
import 'dart:js';

import 'package:dart_js_interop_gen/annotations.dart';
import 'package:js/js.dart';

part 'example.g.dart';

void main() {
  var awesome = MySpecialClass();
  print('awesome: ${awesome}');
  querySelector('#output').text = 'Your Dart app is running.';
  initializeMySpecialClass();
}

@JsMethods()
class MySpecialClass {
  String foo() {
    return "bar!";
  }
}
