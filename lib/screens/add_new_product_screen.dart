import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalpriceTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Enter product title',
                ),
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: const InputDecoration(
                  label: Text('Product code'),
                  hintText: 'Enter Product code',
                ),
              ),
              TextFormField(
                controller: _quantityTEController,
                decoration: const InputDecoration(
                  label: Text('Product Quantity'),
                  hintText: 'Enter Product quantity',
                ),
              ),
              TextFormField(
                controller: _priceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'),
                  hintText: 'Enter price',
                ),
              ),
              TextFormField(
                controller: _totalpriceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Total Price'),
                  hintText: 'Enter total price',
                ),
              ),
              TextFormField(
                controller: _descriptionTEController,
                maxLines: 5,
                decoration: const InputDecoration(
                  label: Text('Description'),
                  hintText: 'Enter Description',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )
                    ),
                onPressed: () {},
                child: const Text('Add'),
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _productCodeTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _totalpriceTEController.dispose();
    _descriptionTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
