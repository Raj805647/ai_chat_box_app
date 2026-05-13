import 'package:ai_chat_bot_app/features/screens/home/home_screen.dart';
import '../features/auth/onboarding/onboarding_screen.dart';
import '../features/auth/sign_in/sign_in_screen.dart';
import '../features/auth/sign_up/sign_up_screen.dart';
import '../features/auth/splash/splash_screen.dart';
import '../features/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../features/screens/profile/profile_screen.dart';
import 'route_names.dart';

import 'package:go_router/go_router.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splashScreen,

    routes: [
      //auth screens
      GoRoute(
        path: RouteNames.splashScreen,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onBoardingScreen,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.signInScreen,
        name: 'sign_in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: RouteNames.signUpScreen,
        name: 'sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),

      //screens
      GoRoute(
        path: RouteNames.bottomNavigationScreen,
        name: 'bottom_bar',
        builder: (context, state) => const BottomNavBarScreen(),
      ),

        GoRoute(
        path: RouteNames.bottomNavigationScreen,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

        GoRoute(
        path: RouteNames.profileScreen,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
