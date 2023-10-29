import 'package:crud_api/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrudApp());
}


class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ProductListScreen(),

    );
  }
}


