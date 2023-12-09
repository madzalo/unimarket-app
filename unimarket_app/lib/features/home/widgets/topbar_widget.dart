import 'package:flutter/material.dart';
import 'package:unimarket_app/core/common/horizontal_space.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  Icons.menu,
                  // size: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            horizontalSpace(10),
            const Column(
              children: [Text("Welcome back"), Text("  Resten Madzalo")],
            )
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/shoes_1.png"),
        ),
      ],
    );
  }
}
