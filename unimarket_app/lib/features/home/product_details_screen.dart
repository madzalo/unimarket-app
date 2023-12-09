import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unimarket_app/core/common/custom_elevated_button.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/product-datails-screen";

  final ProductEntity product;
  ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      controller: pageController,
                      // onPageChanged: () {},
                      itemBuilder: (context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 35,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                              child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: product.images![0],
                              ),
                            ),
                            Positioned(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(
                                      4,
                                      (index) => const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )),
                                )),
                          ],
                        );
                      }),
                ),
                Positioned(
                  bottom: 30,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.54,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${product.name}",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            verticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${product.category}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            verticalSpace(8),
                            Text(
                              "K${product.price}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${product.description}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            verticalSpace(40),
                            CustomElevatedButton(
                                color: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 20, 70, 219),
                                label: "Add To Cart",
                                onTap: () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
