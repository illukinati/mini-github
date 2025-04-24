import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_github/application/repo/repo_provider.dart';
import 'package:mini_github/application/user/user_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/core/router.dart';
import 'package:mini_github/presentation/widgets/search_bar.dart';
import 'package:mini_github/presentation/widgets/user_card.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  bool _isExpanded = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final notifier = ref.read(userNotifierProvider.notifier);
      await notifier.getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.watch(userNotifierProvider.notifier);
    final repoNotifier = ref.watch(repoNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: MyColor.bgBlack,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(
              context: context,
              isExpanded: _isExpanded,
              controller: _controller,
              suffixIconTapped: () {
                setState(() => _isExpanded = false);
                if (_controller.text.isNotEmpty) userNotifier.getAllUsers();
              },
              onChanged: (value) {
                userNotifier.searchUsers(value);
              },
              prefixIconTapped: () {
                setState(() => _isExpanded = true);
              },
            ),
            SizedBox(height: 16),
            if (userState is UserNotFound)
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "No Users Found",
                    style: TextStyle(
                      color: MyColor.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            if (userState is UsersFound)
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: userState.users.length,
                  itemBuilder: (ctx, index) {
                    var user = userState.users[index];
                    return userCard(
                      user: user,
                      onTap: () {
                        userNotifier.getUserDetail(user.login);
                        context.push(MyRouter.userDetail).then((_) {
                          userNotifier.getAllUsers();
                          repoNotifier.getRepos(user.login);
                        });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
