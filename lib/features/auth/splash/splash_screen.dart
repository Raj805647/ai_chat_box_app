import 'package:ai_chat_bot_app/features/auth/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.appMode,
      body: Stack(
        children: [
          /// BACKGROUND GLOW
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.18),
              ),
            ),
          ),

          Positioned(
            bottom: -140,
            right: -100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purpleAccent.withOpacity(0.15),
              ),
            ),
          ),

          /// MAIN CONTENT
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: AppColors.customLinearGradient(),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 35,
                          spreadRadius: 1,
                          color: AppColors.primary.withOpacity(0.45),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "🤖",
                        style: TextStyle(fontSize: 68),
                      ),
                    ),
                  ),

                  spaceHeight(34),

                  /// APP NAME
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xff00E5FF),
                          Color(0xff7C4DFF),
                          Color(0xffFF4081),
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "AI Avatar Nexus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  spaceHeight(14),

                  Text(
                    "Your premium AI companion network",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  spaceHeight(50),

                  /// LOADER
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.8,
                      color: AppColors.primary,
                    ),
                  ),

                  const Spacer(),

                  /// FOOTER TEXT
                  Text(
                    "Powered by Next Generation AI",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white38,
                      letterSpacing: 0.8,
                    ),
                  ),

                  spaceHeight(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
