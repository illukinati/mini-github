import 'package:flutter/material.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/presentation/widgets/profile_bio.dart';
import 'package:mini_github/presentation/widgets/profile_blog.dart';
import 'package:mini_github/presentation/widgets/profile_company.dart';
import 'package:mini_github/presentation/widgets/profile_email.dart';
import 'package:mini_github/presentation/widgets/profile_followers.dart';
import 'package:mini_github/presentation/widgets/profile_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

Widget userProfile({required UserEntity user, required UserState state}) {
  return Skeletonizer(
    enabled: state is Loading,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileHeader(user: user),
        _spacer(),
        profileBio(user: user),
        _spacer(),
        profileEmail(user: user),
        _spacer(),
        profileCompany(user: user),
        _spacer(),
        profileBlog(user: user),
        _spacer(),
        profileFollowers(user: user),
      ],
    ),
  );
}

Widget _spacer() {
  return SizedBox(height: 16, width: 16);
}
