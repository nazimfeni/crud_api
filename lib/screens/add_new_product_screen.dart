import 'dart:convert';

import 'package:crud_api/screens/product.dart';
import 'package:crud_api/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  final Product? product;
  const AddNewProductScreen({Key? key, this.product}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}




class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  late final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalpriceTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool addInprogress = false;
  Future<void> addNewProduct() async {
    addInprogress = true;
    setState(() {});
    final Map<String, String> inputmap = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _titleTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalpriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim(),
    };
    // final Product product =Product(
    //   '',
    //     _imageTEController.text.trim(),
    //     _productCodeTEController.text.trim(),
    //     _titleTEController.text.trim(),
    //     _quantityTEController.text.trim(),
    //      _priceTEController.text.trim(),
    //      _totalpriceTEController.text.trim());


    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {'Content-type': 'Application/json'},
        body: jsonEncode(inputmap));
    if(response.statusCode == 200){
      _imageTEController.clear();
      _productCodeTEController.clear();
      _titleTEController.clear();
      _quantityTEController.clear();
      _totalpriceTEController.clear();
      _priceTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product added!')));


    } else if(response.statusCode == 400){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product code should be unique')));
    }
    addInprogress = false;
    setState(() {});
  }

  Future<void> updateProduct() async {
    addInprogress = true;
    setState(() {});

    // final Product product =Product(
    //   '',
    //     _imageTEController.text.trim(),
    //     _productCodeTEController.text.trim(),
    //     _titleTEController.text.trim(),
    //     _quantityTEController.text.trim(),
    //      _priceTEController.text.trim(),
    //      _totalpriceTEController.text.trim());

    final Map<String, String> inputmap = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _titleTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalpriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim(),
    };


    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product!.id}'),
        headers: {'Content-type': 'Application/json'},
        body: jsonEncode(inputmap));
    if(response.statusCode == 200){
      _imageTEController.clear();
      _productCodeTEController.clear();
      _titleTEController.clear();
      _quantityTEController.clear();
      _totalpriceTEController.clear();
      _priceTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product updated!')));


    } else if(response.statusCode == 400){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product code should be unique!!!')));
    }
    addInprogress = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.product != null){
      _titleTEController.text = widget.product!.productName;
      _productCodeTEController.text = widget.product!.productCode;
      _imageTEController.text = widget.product!.image;
      _quantityTEController.text = widget.product!.quantity;
      _priceTEController.text = widget.product!.unitPrice;
      _totalpriceTEController.text = widget.product!.totalPrice;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    hintText: 'Enter product title',
                  ),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(
                    label: Text('Product code'),
                    hintText: 'Enter Product code',
                  ),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _imageTEController,
                  decoration: const InputDecoration(
                    label: Text('Image'),
                    hintText: 'Enter Image Url',
                  ),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _quantityTEController,
                  decoration: const InputDecoration(
                    label: Text('Product Quantity'),
                    hintText: 'Enter Product quantity',
                  ),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _priceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Price'),
                    hintText: 'Enter price',
                  ),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _totalpriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Total Price'),
                    hintText: 'Enter total price',
                  ),
                  validator: isValidate,
                ),

                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                    width: double.infinity,
                    child: addInprogress
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if(widget.product == null){
                                  addNewProduct();
                                }
                                else{
                                  updateProduct();
                                }

                              }
                            },
                            child: widget.product !=null ? Text('Update') : Text('Add'),
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? isValidate(String? value) {
    if (value?.trim().isNotEmpty ?? false) {
      return null;
    } else {
      return 'Please enter valid value';
    }
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _productCodeTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _totalpriceTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
