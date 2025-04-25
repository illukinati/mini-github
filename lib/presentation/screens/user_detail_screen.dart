import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_github/application/repo/repo_provider.dart';
import 'package:mini_github/application/repo/repo_state.dart' as repo_state;
import 'package:mini_github/application/user/user_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/core/fakes.dart';
import 'package:mini_github/presentation/widgets/repo_card.dart';
import 'package:mini_github/presentation/widgets/repo_header.dart';
import 'package:mini_github/presentation/widgets/skeleton_profile.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../application/repo/repo_state.dart' show ReposFound;

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
                userProfile(user: MyFakeData.instance.user, state: userState),
              if (userState is UserFound)
                userProfile(user: userState.user, state: userState),
              _spacer(),
              _spacer(),
              repoHeader(state: repoState),
              Skeletonizer(
                enabled: repoState is repo_state.Loading,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount:
                      (repoState is ReposFound) ? repoState.repos.length : 10,
                  itemBuilder: (ctx, index) {
                    if (repoState is repo_state.Loading) {
                      return repoCard(repo: MyFakeData.instance.repo);
                    } else if (repoState is repo_state.ReposFound) {
                      var repo = repoState.repos[index];
                      return repoCard(repo: repo);
                    } else {
                      return Center(child: Text("No Repos Found"));
                    }
                  },
                ),
              ),
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
