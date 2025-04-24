import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget profileCompany({required UserEntity user}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 20,
        height: 20,
        child: Icon(Icons.corporate_fare_rounded, color: MyColor.white),
      ),
      SizedBox(width: 16),
      Expanded(
        flex: 1,
        child: Text(
          user.company.isEmpty ? "ー" : user.company,
          style: TextStyle(
            color: MyColor.white,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );
}
