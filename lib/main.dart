import 'package:flutter/material.dart';
import 'package:flutter_movie_dp/pages/application/application.dart';
import 'package:flutter_movie_dp/pages/movies_list/movies_list.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(Application());
}