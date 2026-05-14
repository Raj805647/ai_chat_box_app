import 'dart:ui';
import 'package:ai_chat_bot_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [
                              Color(0xff00E5FF),
                              Color(0xff7B61FF),
                              Color(0xffFF4FD8),
                            ],
                          ).createShader(bounds);
                        },
                        child: const Text(
                          "AI Avatar Nexus",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                   spaceHeight(6),

                      const Text(
                        "Your premium AI companion network",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      _iconButton(
                        icon: LucideIcons.bell,
                        onTap: ()=> provider.navigateTo(context, RouteNames.notificationScreen),
                      ),

                      spaceWidth(10),

                      _iconButton(
                        icon: LucideIcons.settings,
                        onTap: ()=> provider.navigateTo(context, RouteNames.settingsScreen),
                      ),
                    ],
                  ),
                ],
              ),

              spaceHeight(24),

              _glassCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(
                              18,
                            ),
                            gradient:
                            const LinearGradient(
                              colors: [
                                Color(0xff00E5FF),
                                Color(0xff7B61FF),
                              ],
                            ),
                          ),
                          child: const Icon(
                            LucideIcons.sparkles,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),

                        spaceWidth(14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "Ready to connect with AI?",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    spaceHeight(20),

                    Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff00E5FF),
                            Color(0xff7B61FF),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 18,
                            color: const Color(
                              0xff00E5FF,
                            ).withOpacity(0.35),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Upgrade to Pro",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              spaceHeight(26),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        LucideIcons.trendingUp,
                        color: Color(0xff00E5FF),
                      ),

                      SizedBox(width: 8),

                      Text(
                        "Trending Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xff00E5FF),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(width: 4),

                      Icon(
                        LucideIcons.arrowRight,
                        size: 16,
                        color: Color(0xff00E5FF),
                      ),
                    ],
                  ),
                ],
              ),

              spaceHeight(18),

              GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount:
                provider.trendingAvatars.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final avatar =
                  provider.trendingAvatars[index];

                  return _glassCard(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                              gradient: LinearGradient(
                                begin:
                                Alignment.topLeft,
                                end: Alignment
                                    .bottomRight,
                                colors:
                                avatar["colors"],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color:
                                  (avatar["colors"]
                                  [0] as Color)
                                      .withOpacity(
                                    0.35,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                avatar["emoji"],
                                style:
                                const TextStyle(
                                  fontSize: 46,
                                ),
                              ),
                            ),
                          ),
                        ),

                        spaceHeight(14),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text(
                              avatar["name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),

                            Row(
                              children: [
                                const Icon(
                                  LucideIcons.star,
                                  size: 14,
                                  color:
                                  Colors.amber,
                                ),

                                spaceWidth(4),

                                Text(
                                  avatar["rating"],
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        spaceHeight(4),

                        Text(
                          avatar["personality"],
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              spaceHeight(26),

              _glassCard(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Actions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    spaceHeight(16),

                    Row(
                      children: [
                        Expanded(
                          child: _quickActionCard(
                            title: "History",
                            subtitle: "View past calls",
                            onTap: ()=> provider.navigateTo(context, RouteNames.aiChattingHistoryScreen),
                          ),
                        ),

                        spaceWidth(14),

                        Expanded(
                          child: _quickActionCard(
                            title: "AI Chat",
                            subtitle: "Start chatting",
                            onTap: (){},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassCard({
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius:
            BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(
                0.08,
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius:
              BorderRadius.circular(16),
              border: Border.all(
                color:
                Colors.white.withOpacity(0.08),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _quickActionCard({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            spaceHeight(6),

            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}