import 'package:crud_api/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {

            return const ProductItem();
          },
            separatorBuilder: (_, __) => Divider(),
            ),);
  }
}


