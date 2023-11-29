import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color,
    this.backgroundColor,
    this.elevation,
    this.isLoading,
  });
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final double? elevation;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black12)),
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 55),
      ),
      child: isLoading == true
          ? const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          : Text(
              label,
              style: TextStyle(
                  fontSize: 18, color: color, fontWeight: FontWeight.bold),
            ),
    );
  }
}
