import 'package:flutter/material.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: const Color.fromARGB(95, 194, 143, 186),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.23,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(product.image!))),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${product.name}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("K${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: const Icon(
                        Icons.add_shopping_cart,
                        // color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
