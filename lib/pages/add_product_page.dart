import 'dart:html' as html;
import 'package:campus_ebay/colors_decorations/decorations.dart';
import 'package:campus_ebay/pages/mainpage.dart';
import 'package:campus_ebay/pages/my_listings_page.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/mainpage.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  

  ProductForm();
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final List<html.File> _selectedImages = [];

  void _pickImages() async {
  html.InputElement uploadInput = html.FileUploadInputElement() as html.InputElement;
  uploadInput.multiple = true;
  uploadInput.accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(files);
      });
    }
  });
}




  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _saveForm() {
  mytext.context = context;
  if (_formKey.currentState!.validate()) {
    final newProduct = Product(
      name: _nameController.text,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      imageUrls: _selectedImages.map((file) => file.name).toList(),
    );

    // Save the new product using the ProductProvider
    Provider.of<ProductProvider>(context, listen: false).addProduct(newProduct);

    // Reset the form fields
    _formKey.currentState!.reset();
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _selectedImages.clear(); // Assuming _selectedImages is a List<File>

    // Show a Snackbar to indicate the form has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Text(
          'Product listed Successfully!',
          style: mytext.headingtext1(fontSize: 15),
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
      mytext.context=context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product',style: mytext.headingbold(fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              TextFormField(style: mytext.subheadingtext1,
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Enter Product Name',
    labelStyle: TextStyle(color: Colors.white),
    hintText: 'Enter product name',
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    fillColor: Theme.of(context).colorScheme.primaryContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product name';
    }
    return null;
  },
),
SizedBox(height: 20,),
TextFormField(style: mytext.subheadingtext1,
  controller: _descriptionController,
  decoration: InputDecoration(
    labelText: 'Enter Product Description',
    labelStyle: TextStyle(color: Colors.white),
    hintText: 'Enter product description',
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    fillColor: Theme.of(context).colorScheme.primaryContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product description';
    }
    return null;
  },
),
SizedBox(height: 20,),
TextFormField(style: mytext.subheadingtext1,
  controller: _priceController,
  decoration: InputDecoration(
    labelText: 'Enter Product Price',
    labelStyle: TextStyle(color: Colors.white),
    hintText: 'Enter product price',
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    fillColor: Theme.of(context).colorScheme.primaryContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
    ),
  ),
  keyboardType: TextInputType.number,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product price';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  },
),
SizedBox(height: 20,),

              Row(
                children: [
                  Container(height: 60,
                    child: ElevatedButton(style: ButtonStyle(
                            maximumSize: MaterialStateProperty.all(Size(200, 100)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primaryContainer,
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: Colors.white),
                              ),
                            ),
                      onPressed: _pickImages,
                      child: Text('Add Images',style: mytext.headingtext1(fontSize: 15),),
                    ),
                  ),
                 
                ],
              ),
              SizedBox(height: 10),
              _selectedImages.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      children: _selectedImages
                          .asMap()
                          .entries
                          .map(
                            (entry) => ListTile(
                              title: Text(entry.value.name,style: mytext.headingtext1(fontSize: 15)),
                              trailing: IconButton(
                                icon: Icon(Icons.delete,color: Theme.of(context).colorScheme.onBackground,),
                                onPressed: () => _removeImage(entry.key),
                              ),
                            ),
                          )
                          .toList(),
                    ),
              SizedBox(height: 10),
               Row(
                 children: [
                   Container(height: 60,
                     child: ElevatedButton(style: ButtonStyle(
                            maximumSize: MaterialStateProperty.all(Size(200, 120)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primaryContainer,
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: Colors.white),
                              ),
                            ),
                      onPressed: _saveForm,
                      child: Text('Save Product',style: mytext.headingtext1(fontSize: 15)),
                                   ),
                   ),
                                 Expanded(child: SizedBox())
                 ],
               ),
              
            ],
          ),
        ),
      ),
    );
  }
}
