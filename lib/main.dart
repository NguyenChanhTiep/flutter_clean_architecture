import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/pages/application/application.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(Application());
}
