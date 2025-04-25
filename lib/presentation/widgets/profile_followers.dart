import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/core/formatter.dart';

Widget profileFollowers({UserEntity? user}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 20,
        height: 20,
        child: Icon(Icons.people_outline, color: MyColor.white),
      ),
      SizedBox(width: 16),
      Text(
        MyFormatter.numberFormatter(user?.followers ?? 0),
        style: TextStyle(
          fontFamily: "Roboto",
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
      Text(
        " followers・",
        style: TextStyle(
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
      Text(
        MyFormatter.numberFormatter(user?.following ?? 0),
        style: TextStyle(
          fontFamily: "Roboto",
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
      Text(
        " following",
        style: TextStyle(
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    ],
  );
}
