import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget profileBlog({required UserEntity user}) {
  return GestureDetector(
    onTap: () async {
      if (!await launchUrl(Uri.parse(user.blog))) {
        throw Exception('Could not launch');
      }
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Icon(Icons.link_rounded, color: MyColor.white),
        ),
        SizedBox(width: 16),
        Text(
          user.blog.isEmpty ? "ー" : user.blog,
          style: TextStyle(
            color: MyColor.white,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}
