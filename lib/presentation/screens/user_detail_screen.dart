import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_github/application/repo/repo_provider.dart';
import 'package:mini_github/application/repo/repo_state.dart' as repo_state;
import 'package:mini_github/application/user/user_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/widgets/profile_blog.dart';
import 'package:mini_github/presentation/widgets/profile_bio.dart';
import 'package:mini_github/presentation/widgets/profile_company.dart';
import 'package:mini_github/presentation/widgets/profile_email.dart';
import 'package:mini_github/presentation/widgets/profile_followers.dart';
import 'package:mini_github/presentation/widgets/profile_header.dart';
import 'package:mini_github/presentation/widgets/repo_card.dart';
import 'package:mini_github/presentation/widgets/repo_header.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final repoState = ref.watch(repoNotifierProvider);

    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.chevron_left_rounded, color: MyColor.white),
        ),
        title: Text(
          'user detail',
          style: TextStyle(color: MyColor.white, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (userState is Loading)
                Center(child: CircularProgressIndicator(color: MyColor.blue)),
              if (userState is UserFound) ...[
                profileHeader(user: userState.user),
                _spacer(),
                profileBio(user: userState.user),
                _spacer(),
                profileEmail(user: userState.user),
                _spacer(),
                profileCompany(user: userState.user),
                _spacer(),
                profileBlog(user: userState.user),
                _spacer(),
                profileFollowers(user: userState.user),
              ],
              _spacer(),
              _spacer(),
              if (repoState is repo_state.ReposFound) ...[
                repoHeader(repos: repoState.repos),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: repoState.repos.length,
                  itemBuilder: (ctx, index) {
                    var repo = repoState.repos[index];
                    return repoCard(repo: repo);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacer() {
    return SizedBox(height: 16, width: 16);
  }
}
