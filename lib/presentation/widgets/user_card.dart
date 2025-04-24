import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';

import 'avatar.dart';

Widget userCard({required UserEntity user}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: MyColor.border, width: .3),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        avatar(url: user.avatarUrl),
        SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Text(
            user.login,
            style: TextStyle(color: MyColor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
