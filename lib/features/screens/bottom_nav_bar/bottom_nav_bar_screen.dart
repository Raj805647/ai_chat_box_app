import 'dart:ui';

import 'package:ai_chat_bot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widget/help_widget.dart';
import 'bottom_nav_bar_provider.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavBarProvider>();

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.appMode,

      body: Column(
        children: [

          Expanded(
            child:
            provider.screens[provider.currentIndex]['onTap'],
          ),

          SafeArea(
            top: false,
            child: SizedBox(
              height: 115,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius:
                        BorderRadius.circular(28),
                        border: Border.all(
                          color: Colors.white.withOpacity(
                            0.08,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            spreadRadius: 1,
                            color: Colors.black.withOpacity(
                              0.25,
                            ),
                          ),
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: List.generate(
                          provider.screens.length,
                              (index) {
                            final item =
                            provider.screens[index];

                            final bool isActive =
                                provider.currentIndex ==
                                    index;

                            return GestureDetector(
                              onTap: () {
                                provider.changeIndex(
                                  index,
                                );
                              },

                              child: AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                    18,
                                  ),
                                ),

                                child: Column(
                                  mainAxisSize:
                                  MainAxisSize.min,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                      const Duration(
                                        milliseconds: 250,
                                      ),
                                      padding:
                                      const EdgeInsets.all(
                                        12,
                                      ),

                                      decoration: BoxDecoration(
                                        shape:
                                        BoxShape.circle,

                                        gradient: isActive
                                            ? AppColors
                                            .customLinearGradient()
                                            : null,

                                        boxShadow: isActive
                                            ? [
                                          BoxShadow(
                                            blurRadius:
                                            18,
                                            color: const Color(
                                              0xff00E5FF,
                                            ).withOpacity(
                                              0.35,
                                            ),
                                          ),
                                        ]
                                            : [],
                                      ),

                                      child: Icon(
                                        item['icon'],
                                        size: 21,
                                        color: isActive
                                            ? Colors.white
                                            : Colors.white70,
                                      ),
                                    ),

                                    spaceHeight(5),

                                    /// LABEL

                                    AnimatedDefaultTextStyle(
                                      duration:
                                      const Duration(
                                        milliseconds: 250,
                                      ),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight:
                                        FontWeight.w600,
                                        color: isActive
                                            ? AppColors
                                            .primary
                                            : Colors.white60,
                                      ),
                                      child: Text(
                                        item['label'],
                                      ),
                                    ),

                                    /// ACTIVE DOT

                                    AnimatedContainer(
                                      duration:
                                      const Duration(
                                        milliseconds: 250,
                                      ),
                                      margin:
                                      const EdgeInsets.only(
                                        top: 4,
                                      ),
                                      width: isActive ? 5 : 0,
                                      height:
                                      isActive ? 5 : 0,
                                      decoration:
                                      const BoxDecoration(
                                        shape:
                                        BoxShape.circle,
                                        color: Color(
                                          0xff00E5FF,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
