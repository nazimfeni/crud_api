import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text('Select Action'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Edit'),
                        leading: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewProductScreen()));
                        },
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        title: Text('Delete'),
                        leading: Icon(Icons.delete_outline),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
            });
      },
      leading: Image.asset(
        'images/product1.jpg',
        width: 80,
      ),
      title: Text('Product Name'),
      subtitle: Text('Product Description'),
      trailing: Text('\$120'),
    );
  }
}
