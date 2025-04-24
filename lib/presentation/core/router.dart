import 'package:go_router/go_router.dart';
import 'package:mini_github/presentation/screens/user_list_screen.dart';

class MyRouter {
  static String createCallRoute = "/user-repo";

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, state) => const UserListScreen()),
      // GoRoute(
      //     path: '/create-call', builder: (_, state) => const CreateCallPage()),
    ],
  );
}
