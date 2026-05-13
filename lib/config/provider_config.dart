import 'dart:ffi';

import '../features/auth/onboarding/onboarding_provider.dart';
import '../features/auth/sign_in/sign_in_provider.dart';
import '../features/auth/sign_up/sign_up_provider.dart';
import '../features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

import '../features/screens/bottom_nav_bar/bottom_nav_bar_provider.dart';
import '../features/screens/home/home_provider.dart';
import '../features/screens/profile/profile_pprovider.dart';

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


  ];
}
