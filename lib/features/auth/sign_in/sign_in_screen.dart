import 'package:ai_chat_bot_app/features/auth/sign_in/sign_in_provider.dart';
import 'package:ai_chat_bot_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../routes/route_names.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignInProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

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
              child: const Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Login to continue your AI journey",
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),

            const SizedBox(height: 50),

            customTextField(
              provider.emailController,
              "Email Address",
            ),

            const SizedBox(height: 18),

            customTextField(
            provider.passwordController,
               "Password",
              obscure: true,
            ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: provider.isLoading
                  ? null
                  : () => provider.login(context),
              child: Container(
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient:
                  AppColors.customLinearGradient(),
                ),
                child: Center(
                  child: provider.isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: GestureDetector(
                onTap: () {
                 provider.navigateTo(
                    context,
                    RouteNames.signUpScreen,
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
