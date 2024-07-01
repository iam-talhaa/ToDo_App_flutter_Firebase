import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final bool loading;
  final name;
  final VoidCallback ontap;
  RoundedButton(
      {super.key,
      required this.name,
      required this.ontap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.lightGreen,
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
