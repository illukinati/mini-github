import 'package:go_router/go_router.dart';
import 'package:mini_github/presentation/screens/user_detail_screen.dart';
import 'package:mini_github/presentation/screens/user_list_screen.dart';

class MyRouter {
  static String userDetail = "/user-detail";

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, state) => const UserListScreen()),
      GoRoute(
        path: userDetail,
        builder: (_, state) => const UserDetailScreen(),
      ),
    ],
  );
}
