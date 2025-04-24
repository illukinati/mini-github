import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'avatar.dart';

Widget profileHeader({required UserEntity user}) {
  return Row(
    children: [
      avatar(url: user.avatarUrl, size: 100),
      SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                color: MyColor.white,
                fontWeight: FontWeight.w900,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              user.login,
              style: TextStyle(fontSize: 16, color: MyColor.white),
            ),
          ],
        ),
      ),
      IconButton(
        onPressed: () async {
          if (!await launchUrl(Uri.parse(user.url))) {
            throw Exception('Could not launch');
          }
        },
        icon: Icon(Icons.open_in_new, color: MyColor.white),
      ),
      SizedBox(width: 8),
    ],
  );
}
