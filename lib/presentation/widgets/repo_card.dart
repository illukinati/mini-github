import 'package:flutter/material.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget repoCard({required RepoEntity repo}) {
  return GestureDetector(
    onTap: () async {
      if (!await launchUrl(Uri.parse(repo.url))) {
        throw Exception('Could not launch');
      }
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.border, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.book, color: MyColor.lightGrey),
              SizedBox(width: 8),
              Text(
                repo.repositoryName,
                style: TextStyle(
                  color: MyColor.blue,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            repo.description,
            style: TextStyle(
              color: MyColor.lightGrey,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(width: 4),
              Text(repo.language, style: TextStyle(color: MyColor.white)),
              SizedBox(width: 8),
              Icon(Icons.star_border_rounded, color: MyColor.lightGrey),
              Text(
                repo.starCount.toString(),
                style: TextStyle(color: MyColor.white),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
