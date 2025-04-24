import 'package:flutter/material.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget avatar({required String url}) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      border: Border.all(color: MyColor.border, width: 1),
      borderRadius: BorderRadius.circular(50),
    ),
    child: ClipOval(
      child: Image.network(
        url,
        errorBuilder: (_, err, trace) {
          return const SizedBox(
            width: 50,
            height: 50,
            child: Icon(Icons.broken_image, color: Colors.grey),
          );
        },
      ),
    ),
  );
}
