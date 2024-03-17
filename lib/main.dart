import 'package:flutter/material.dart';
import 'package:task3/services/shared_service.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}
