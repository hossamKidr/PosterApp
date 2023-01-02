import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:go_plus/injector.dart'as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await di.init();
  runApp(const MyApp());
}
