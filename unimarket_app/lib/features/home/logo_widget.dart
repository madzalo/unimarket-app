import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoSvgWidget extends StatelessWidget {
  const LogoSvgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/Artboard2.svg',
      height: 200,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      color: const Color.fromARGB(255, 20, 70, 219),
      semanticsLabel: 'Logo',
    );
  }
}
