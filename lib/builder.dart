/// Support for doing something awesome.
///
/// More dartdocs go here.
library dart_js_interop_gen;

import 'package:build/build.dart';
import 'package:dart_js_interop_gen/src/method_gen.dart';
import 'package:source_gen/source_gen.dart';

export 'src/method_gen.dart';

Builder jsMethodsGen(BuilderOptions builderOptions) =>
    SharedPartBuilder([const ClassMethodGenerator()], 'methods');
