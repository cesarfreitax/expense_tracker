import 'package:expense_tracker/theme/Theme.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  runApp(MaterialApp(
    darkTheme: darkTheme,
    theme: lightTheme,
    home: const Expenses(),
  ));
  // });
}
