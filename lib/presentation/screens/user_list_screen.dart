import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_github/application/user/user_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/widgets/avatar.dart';
import 'package:mini_github/presentation/widgets/search_bar.dart';

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

    ref.listen(userNotifierProvider, (_, state) {
      // debugPrint("state: $state");
    });

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
                _controller.clear();
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
                    style: TextStyle(color: MyColor.white),
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
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColor.border, width: .3),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          avatar(url: user.avatarUrl),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Text(
                              user.login,
                              style: TextStyle(color: MyColor.white),
                            ),
                          ),
                        ],
                      ),
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
