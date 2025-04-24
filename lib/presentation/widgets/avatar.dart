import 'package:flutter/material.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget avatar({required String url, double size = 50}) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      border: Border.all(color: MyColor.border, width: 1),
      borderRadius: BorderRadius.circular(size),
    ),
    child: ClipOval(
      child: Image.network(
        url,
        errorBuilder: (_, err, trace) {
          return SizedBox(
            width: size,
            height: size,
            child: Icon(Icons.broken_image, color: Colors.grey, size: size),
          );
        },
      ),
    ),
  );
}
