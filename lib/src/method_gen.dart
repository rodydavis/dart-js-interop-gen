// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import 'package:analyzer/dart/element/element.dart';

class ClassMethodGenerator extends GeneratorForAnnotation<JsMethods> {
  final bool forClasses, forLibrary;

  const ClassMethodGenerator({this.forClasses = true, this.forLibrary = false});

  @override
  String generateForAnnotatedElement(element, annotation, buildStep) {
    final className = element.displayName;
    final sb = StringBuffer();

    if (element is ClassElement) {
      sb.writeln('final _class = ${className}();');
      sb.writeln('void initialize${className}() {');
      for (final method in element.methods) {
        final name = method.name;
        sb.writeln("context['${name}'] = allowInterop(_class.${name});");
      }
    }

    sb.write('}');
    return sb.toString();
  }
}
