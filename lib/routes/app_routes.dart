import 'package:ai_chat_bot_app/features/screens/ai_audio_video/ai_audio_video_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_avtar/ai_avtar_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_call_history/ai_call_history_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_chating/ai_chatting_screen.dart';
import 'package:ai_chat_bot_app/features/screens/home/home_screen.dart';
import 'package:ai_chat_bot_app/features/screens/notification/notification_screen.dart';
import 'package:ai_chat_bot_app/features/screens/settings/settings_screen.dart';
import 'package:ai_chat_bot_app/features/screens/subscription/subscription_screen.dart';
import '../features/auth/onboarding/onboarding_screen.dart';
import '../features/auth/sign_in/sign_in_screen.dart';
import '../features/auth/sign_up/sign_up_screen.dart';
import '../features/auth/splash/splash_screen.dart';
import '../features/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../features/screens/profile/profile_screen.dart';
import '../features/screens/profile_details/profile_details_screen.dart';
import 'route_names.dart';

import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splashScreen,
    routes: [
      //auth screens
      GoRoute(
        path: RouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.signInScreen,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: RouteNames.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      //screens
      GoRoute(
        path: RouteNames.bottomNavigationScreen,
        builder: (context, state) => const BottomNavBarScreen(),
      ),
      GoRoute(
        path: RouteNames.bottomNavigationScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.aiAudioVideoScreen,
        builder: (context, state) => const AiAudioVideoScreen(),
      ),
      GoRoute(
        path: RouteNames.aiAvtarScreen,
        builder: (context, state) => const AiAvtarScreen(),
      ),
      GoRoute(
        path: RouteNames.aiChattingScreen,
        builder: (context, state) => const AiChattingScreen(),
      ),
      GoRoute(
        path: RouteNames.notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: RouteNames.settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: RouteNames.subscriptionScreen,
        builder: (context, state) => const SubscriptionScreen(),
      ),
      GoRoute(
        path: RouteNames.aiChattingHistoryScreen,
        builder: (context, state) => const AiCallHistoryScreen(),
      ),
      GoRoute(
        path: RouteNames.profileDetailsScreen,
        builder: (context, state) => const ProfileDetailsScreen(),
      ),
    ],
  );
}
