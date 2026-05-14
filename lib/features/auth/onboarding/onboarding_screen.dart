import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_colors.dart';
import 'onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,
      body: Stack(
        children: [
          /// TOP GLOW
          Positioned(
            top: -120,
            left: -50,
            right: -50,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// BOTTOM GLOW
          Positioned(
            bottom: -150,
            left: -80,
            right: -80,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.purpleAccent.withOpacity(0.20),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: provider.pageController,
                    itemCount: provider.onboardingData.length,
                    onPageChanged: provider.onPageChanged,
                    itemBuilder: (context, index) {
                      final item = provider.onboardingData[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient:
                                AppColors.customLinearGradient(),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40,
                                    color: AppColors.primary
                                        .withOpacity(0.45),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  item['emoji'],
                                  style: const TextStyle(fontSize: 80),
                                ),
                              ),
                            ),

                            const SizedBox(height: 50),

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
                                item['title'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              item['description'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    provider.onboardingData.length,
                        (index) {
                      final isActive =
                          provider.currentIndex == index;

                      return AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 300),
                        margin:
                        const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: isActive ? 26 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: isActive
                              ? AppColors.customLinearGradient()
                              : null,
                          color:
                          isActive ? null : Colors.white24,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () {
                      provider.nextPage(context);
                    },
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient:
                        AppColors.customLinearGradient(),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            color: AppColors.primary
                                .withOpacity(0.45),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          provider.currentIndex ==
                              provider.onboardingData.length - 1
                              ? "Get Started"
                              : "Continue",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
