import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testnew/screens/show_address.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

      SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        
    return const MaterialApp(
      home: ListaddressPage(),
    );
  }
}
