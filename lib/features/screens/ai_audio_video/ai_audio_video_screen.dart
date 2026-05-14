import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'ai_audio_video_provider.dart';

class AiAudioVideoScreen extends StatelessWidget {
  const AiAudioVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<AiAudioVideoProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 30,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    /// AVATAR WITH GLOW

                    TweenAnimationBuilder<double>(
                      tween: Tween(
                        begin: 0.9,
                        end: 1.05,
                      ),
                      duration:
                      const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      builder:
                          (context, value, child) {
                        return AnimatedContainer(
                          duration:
                          const Duration(
                            seconds: 2,
                          ),
                          width: 180 * value,
                          height: 180 * value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:
                            const LinearGradient(
                              begin:
                              Alignment.topLeft,
                              end: Alignment
                                  .bottomRight,
                              colors: [
                                Color(0xff00E5FF),
                                Color(0xff7B61FF),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 4,
                                color: const Color(
                                  0xff00E5FF,
                                ).withOpacity(
                                  0.45,
                                ),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [

                              /// AVATAR

                              const Center(
                                child: Text(
                                  "👩‍💼",
                                  style:
                                  TextStyle(
                                    fontSize: 75,
                                  ),
                                ),
                              ),

                              /// ONLINE DOT

                              Positioned(
                                bottom: 14,
                                right: 14,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration:
                                  BoxDecoration(
                                    shape:
                                    BoxShape
                                        .circle,
                                    color:
                                    Colors.green,
                                    border:
                                    Border.all(
                                      color: const Color(
                                        0xff070B14,
                                      ),
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    spaceHeight(40),

                    /// NAME

                    const Text(
                      "Sophia",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    spaceHeight(8),

                    /// STATUS

                    const Text(
                      "Connected",
                      style: TextStyle(
                        color: Color(0xff00E5FF),
                        fontSize: 15,
                        fontWeight:
                        FontWeight.w500,
                      ),
                    ),

                    spaceHeight(12),

                    /// TIMER

                    Text(
                      provider.formatDuration(),
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 22,
                        fontWeight:
                        FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),

                    spaceHeight(40),

                    /// ACTION BUTTONS

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        /// MIC

                        _callActionButton(
                          icon: provider.isMuted
                              ? LucideIcons.micOff
                              : LucideIcons.mic,
                          isActive:
                          provider.isMuted,
                          onTap: () {
                            provider.toggleMute();
                          },
                        ),

                        spaceWidth(24),

                        /// VIDEO

                        _callActionButton(
                          icon: provider.isVideoOn
                              ? LucideIcons.video
                              : LucideIcons
                              .videoOff,
                          isActive:
                          !provider.isVideoOn,
                          onTap: () {
                            provider.toggleVideo();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ---------------- END CALL BUTTON ----------------

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(22),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFF4FD8),
                        Color(0xffFF3B30),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 24,
                        color: const Color(
                          0xffFF4FD8,
                        ).withOpacity(0.35),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Icon(
                        LucideIcons.phoneOff,
                        color: Colors.white,
                        size: 20,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "End Call",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ------------------------------------------------
  /// GLASS BUTTON
  /// ------------------------------------------------

  Widget _glassButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(0.05),
              borderRadius:
              BorderRadius.circular(
                16,
              ),
              border: Border.all(
                color: Colors.white
                    .withOpacity(0.08),
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

  /// ------------------------------------------------
  /// CALL ACTION BUTTON
  /// ------------------------------------------------

  Widget _callActionButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? const Color(0xffFF4FD8)
              : Colors.white.withOpacity(0.06),
          border: Border.all(
            color: Colors.white.withOpacity(
              0.08,
            ),
          ),
          boxShadow: isActive
              ? [
            BoxShadow(
              blurRadius: 20,
              color: const Color(
                0xffFF4FD8,
              ).withOpacity(0.35),
            ),
          ]
              : [],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
