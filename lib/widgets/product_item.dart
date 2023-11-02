import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:crud_api/screens/product.dart';
import 'package:crud_api/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product, required this.onPressDelete}) : super(key: key);

  final Product product;
  final Function(String) onPressDelete;

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
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       AddNewProductScreen(product: product,)));

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
                          onPressDelete(product.id);
                        },
                      ),
                    ],
                  ));
            });
      },
      leading: Image.network(
        product.image,
        width: 80,
      ),
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productCode),
          Text('Total Price: ${product.totalPrice} '),
          Text('Quantity: ${product.quantity} ')
        ],
      ),
      trailing: Text('\$${product.unitPrice}'),
    );
  }
}
