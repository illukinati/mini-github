import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget profileBio({required UserEntity user}) {
  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: 40),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColor.border, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        (user.bio).isEmpty ? "No Bio" : user.bio,
        style: TextStyle(
          color: MyColor.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
