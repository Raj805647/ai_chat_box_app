import 'package:ai_chat_bot_app/features/auth/sign_up/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/help_widget.dart';
import '../../../widget/ui_design.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "Create Account 🚀",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              customTextField(provider.nameController, "Full Name"),
              const SizedBox(height: 16),

              customTextField(provider.emailController, "Email"),
              const SizedBox(height: 16),

              customTextField(provider.numberController, "Phone Number"),
              const SizedBox(height: 16),

              customTextField(
                provider.passwordController,
                "Password",
                obscure: provider.obscurePassword,
              ),

              const SizedBox(height: 16),

              customTextField(
                provider.confirmPasswordController,
                "Confirm Password",
                obscure: provider.obscureConfirmPassword,
              ),

              const SizedBox(height: 16),

              customTextField(
                provider.companyController,
                "Company Name (Optional)",
              ),

              const SizedBox(height: 16),

              customTextField(
                provider.websiteController,
                "Website (Optional)",
              ),

              const SizedBox(height: 30),

              Container(
                height: 58,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: AppColors.customLinearGradient(),
                ),
                child: const Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}