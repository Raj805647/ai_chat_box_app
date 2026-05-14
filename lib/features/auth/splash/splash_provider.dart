import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:base_module/providers/base_providers.dart';

import '../../../routes/route_names.dart';

class SplashProvider extends BaseProvider {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    navigateAndClearStack(context, RouteNames.onBoardingScreen);
  }
}
