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

              _field(provider.nameController, "Full Name"),
              const SizedBox(height: 16),

              _field(provider.emailController, "Email"),
              const SizedBox(height: 16),

              _field(provider.numberController, "Phone Number"),
              const SizedBox(height: 16),

              _field(
                provider.passwordController,
                "Password",
                obscure: provider.obscurePassword,
              ),

              const SizedBox(height: 16),

              _field(
                provider.confirmPasswordController,
                "Confirm Password",
                obscure: provider.obscureConfirmPassword,
              ),

              const SizedBox(height: 16),

              _field(
                provider.companyController,
                "Company Name (Optional)",
              ),

              const SizedBox(height: 16),

              _field(
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

  Widget _field(
      TextEditingController controller,
      String hint, {
        bool obscure = false,
      }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
        ),
      ),
    );
  }
}