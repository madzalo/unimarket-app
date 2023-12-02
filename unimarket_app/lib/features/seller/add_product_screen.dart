import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimarket_app/core/common/custom_elevated_button.dart';
import 'package:unimarket_app/core/common/custom_text_form_field.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/core/utils/utils.dart';
import 'package:unimarket_app/features/product/data/models/sell_product_model.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_event.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/add-product-screen';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _addProductFormKey = GlobalKey<FormState>();

  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController productQuantity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    productName.dispose();
    productDescription.dispose();
    productPrice.dispose();
    productQuantity.dispose();
  }

  List<File> images = [];

  void selectimages() async {
    var response = await pickImages();
    setState(() {
      images = response;
    });
  }

  List<String> productcategories = ["Popular", "Top Selling", "New Arrivals"];
  String category = "Top Selling";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: const Text("Add Product"),
            centerTitle: true,
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  verticalSpace(20),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectimages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  Text("Select Product Images")
                                ],
                              ),
                            ),
                          ),
                        ),
                  verticalSpace(20),
                  CustomTextFormField(
                      controller: productName, label: "Product Name"),
                  verticalSpace(20),
                  CustomTextFormField(
                    controller: productDescription,
                    label: "Description",
                    maxLines: 3,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                      controller: productPrice, label: "Price "),
                  verticalSpace(20),
                  CustomTextFormField(
                      controller: productQuantity, label: "Quantity"),
                  verticalSpace(20),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      onChanged: (String? newValue) {
                        setState(() {
                          category = newValue!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: productcategories.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                    ),
                  ),
                  verticalSpace(20),
                  CustomElevatedButton(
                      label: "Sell Product",
                      onTap: () {
                        // _onSellProduct(
                        //     context,
                        //     SellProductModel(
                        //         name: productName.text,
                        //         description: productDescription.text,
                        //         price: double.parse(productPrice.text),
                        //         quantity:
                        //             double.parse(productQuantity.text),
                        //         category: category,
                        //         images: images));
                      })
                ],
              ),
            )),
      ),
    );
  }

  void _onSellProduct(
    BuildContext context,
    SellProductModel sellProductModel,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString('token');

    print("Sell Product");
    print(sellProductModel);
    print(token);
    BlocProvider.of<ProductBloc>(context)
        .add(SellProduct(sellProductModel, token!));
  }
}
