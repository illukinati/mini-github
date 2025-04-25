import 'package:flutter/material.dart';
import 'package:mini_github/application/repo/repo_state.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';

Widget repoHeader({required RepoState state}) {
  List<RepoEntity>? repos;

  if (state is ReposFound) {
    repos = state.repos;
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: MyColor.orange, width: 2)),
        ),
        child: Row(
          children: [
            Icon(Icons.book, color: MyColor.lightGrey),
            SizedBox(width: 8),
            Text(
              "Repository",
              style: TextStyle(
                color: MyColor.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            if (repos != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: MyColor.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  repos.length.toString(),
                  style: TextStyle(
                    color: MyColor.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: MyColor.border, width: 1)),
          ),
        ),
      ),
    ],
  );
}
