import 'package:flutter/material.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/shoes_1.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sneakers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "K25000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                verticalSpace(5),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              count--;
                            });
                          },
                          child: const Icon(Icons.remove, color: Colors.black)),
                      Text(
                        "$count",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_shopping_cart,
                        color: Colors.red)),
              ],
            ),
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
