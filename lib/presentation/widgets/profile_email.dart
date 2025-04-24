import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget profileEmail({required UserEntity user}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 20,
        height: 20,
        child: Icon(Icons.email_outlined, color: MyColor.white),
      ),
      SizedBox(width: 16),
      Text(
        user.email.isEmpty ? "ー" : user.email,
        style: TextStyle(
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
      SizedBox(width: 16),
      SizedBox(
        width: 20,
        height: 20,
        child: Icon(Icons.location_on_outlined, color: MyColor.white),
      ),
      SizedBox(width: 16),
      Text(
        user.location.isEmpty ? "ー" : user.location,
        style: TextStyle(
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    ],
  );
}
