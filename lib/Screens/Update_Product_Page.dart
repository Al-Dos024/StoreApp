// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Services/update_product.dart';
import 'package:store_app/Widgets/Custom_Button.dart';
import 'package:store_app/Widgets/Custom_Field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, img, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          //iconTheme: Colors.black,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChange: (p0) => productName = p0,
                  hintText: 'Product Name:',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChange: (p0) => desc = p0,
                  hintText: 'Description:',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChange: (p0) => price = p0,
                  hintText: 'Price:',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChange: (p0) => img = p0,
                  hintText: 'Image:',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: img == null ? product.image : img!,
        id: product.id,
        category: product.category);
  }
}
