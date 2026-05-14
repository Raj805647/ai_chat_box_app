import 'dart:ffi';

import 'package:ai_chat_bot_app/features/screens/ai_audio_video/ai_audio_video_provider.dart';
import 'package:ai_chat_bot_app/features/screens/ai_audio_video/ai_audio_video_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_avtar/ai_avtar_provider.dart';
import 'package:ai_chat_bot_app/features/screens/ai_avtar/ai_avtar_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_call_history/ai_call_history_provider.dart';
import 'package:ai_chat_bot_app/features/screens/ai_chating/ai_chating_provider.dart';
import 'package:ai_chat_bot_app/features/screens/notification/notification_provider.dart';
import 'package:ai_chat_bot_app/features/screens/profile_details/profile_details_provider.dart';
import 'package:ai_chat_bot_app/features/screens/settings/settings_provider.dart';
import 'package:ai_chat_bot_app/features/screens/subscription/subscription_provider.dart';

import '../features/auth/onboarding/onboarding_provider.dart';
import '../features/auth/sign_in/sign_in_provider.dart';
import '../features/auth/sign_up/sign_up_provider.dart';
import '../features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

import '../features/screens/bottom_nav_bar/bottom_nav_bar_provider.dart';
import '../features/screens/home/home_provider.dart';
import '../features/screens/profile/profile_provider.dart';

class ProviderConfig {
  static List<ChangeNotifierProvider> providers = [
    // auth provider
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<OnboardingProvider>(create: (_) => OnboardingProvider()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),

    //screen
    ChangeNotifierProvider<BottomNavBarProvider>(create: (_) => BottomNavBarProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
    ChangeNotifierProvider<AiAvtarProvider>(create: (_) => AiAvtarProvider()),
    ChangeNotifierProvider<AiChattingProvider>(create: (_) => AiChattingProvider()),
    ChangeNotifierProvider<AiAudioVideoProvider>(create: (_) => AiAudioVideoProvider()),
    ChangeNotifierProvider<AiCallHistoryProvider>(create: (_) => AiCallHistoryProvider()),
    ChangeNotifierProvider<ProfileDetailsProvider>(create: (_) => ProfileDetailsProvider()),
    ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider()),
    ChangeNotifierProvider<SubscriptionProvider>(create: (_) => SubscriptionProvider()),
    ChangeNotifierProvider<NotificationProvider>(create: (_) => NotificationProvider()),

  ];
}
