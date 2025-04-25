import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

Widget profileEmail({UserEntity? user}) {
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
        (user?.email.isEmpty ?? true) ? "-" : user!.email,
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
      Expanded(
        flex: 1,
        child: Text(
          (user?.location.isEmpty ?? true) ? "-" : user!.location,
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
