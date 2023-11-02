import 'dart:convert';

import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:crud_api/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool inProgress = false;

  @override
  void initState() {
    getProductList();
    // TODO: implement initState
    super.initState();
  }

  void getProductList() async {
    inProgress = true;
    setState(() {

    });
    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product(
              productJson['_id'],
              productJson['ProductName'],
              productJson['ProductCode'],
              productJson['Img'],
              productJson['UnitPrice'],
              productJson['Qty'],
              productJson['TotalPrice']));
        }
      }
    }
    inProgress = false;
    print(productList.length);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddNewProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: inProgress ? Center(child: CircularProgressIndicator(),) : ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItem(product: productList[index],);
        },
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}

class Product {
  final String id;
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product(this.id, this.productName, this.productCode, this.image,
      this.unitPrice, this.quantity, this.totalPrice);
}
