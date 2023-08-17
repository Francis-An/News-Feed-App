import 'package:atunews/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AtuNewsHub());
}

class AtuNewsHub extends StatelessWidget {
  const AtuNewsHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ATU News Hub",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
