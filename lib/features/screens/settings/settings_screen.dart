import 'dart:ui';
import 'package:ai_chat_bot_app/features/screens/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<SettingsProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),
          child: SingleChildScrollView(
            physics:
            const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    /// BACK BUTTON

                    _glassButton(
                      icon: LucideIcons.arrowLeft,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    spaceWidth(14),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: const [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Customize your experience",
                          style: TextStyle(
                            color:
                            Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                spaceHeight(24),
                _glassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [

                      /// TITLE

                      const Text(
                        "Appearance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                      spaceHeight(20),

                      /// DARK MODE

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Row(
                            children: [

                              Icon(
                                provider.darkMode
                                    ? LucideIcons
                                    .moon
                                    : LucideIcons
                                    .sun,
                                color: provider
                                    .darkMode
                                    ? const Color(
                                  0xff7B61FF,
                                )
                                    : const Color(
                                  0xffFFC107,
                                ),
                                size: 22,
                              ),

                              spaceWidth(14),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: const [
                                  Text(
                                    "Dark Mode",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,
                                      fontSize:
                                      15,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    3,
                                  ),

                                  Text(
                                    "Toggle theme appearance",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white60,
                                      fontSize:
                                      11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          _customSwitch(
                            value: provider
                                .darkMode,
                            activeGradient:
                            const [
                              Color(
                                0xff00E5FF,
                              ),
                              Color(
                                0xff7B61FF,
                              ),
                            ],
                            onTap: () {
                              provider
                                  .toggleDarkMode();
                            },
                          ),
                        ],
                      ),

                      spaceHeight(18),

                      /// THEME COLOR

                      Container(
                        padding:
                        const EdgeInsets.all(
                          14,
                        ),
                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            18,
                          ),
                          color: Colors.white
                              .withOpacity(
                            0.04,
                          ),
                          border: Border.all(
                            color: Colors.white
                                .withOpacity(
                              0.08,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [

                            const Icon(
                              LucideIcons
                                  .palette,
                              color: Color(
                                0xff00E5FF,
                              ),
                              size: 22,
                            ),

                            spaceWidth(14),

                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: const [
                                Text(
                                  "Theme Color",
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize:
                                    15,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                  ),
                                ),

                                SizedBox(
                                  height:
                                  3,
                                ),

                                Text(
                                  "Neon Purple (Active)",
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .white60,
                                    fontSize:
                                    11,
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

                spaceHeight(20),
                _glassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [

                      const Text(
                        "Preferences",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                      spaceHeight(20),

                      /// NOTIFICATIONS

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [

                          Row(
                            children: [

                              const Icon(
                                LucideIcons
                                    .bell,
                                color: Color(
                                  0xffFF4FD8,
                                ),
                                size: 22,
                              ),

                              spaceWidth(14),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: const [
                                  Text(
                                    "Notifications",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,
                                      fontSize:
                                      15,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    3,
                                  ),

                                  Text(
                                    "Enable push notifications",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white60,
                                      fontSize:
                                      11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          _customSwitch(
                            value: provider
                                .notifications,
                            activeGradient:
                            const [
                              Color(
                                0xff00E5FF,
                              ),
                              Color(
                                0xff7B61FF,
                              ),
                            ],
                            onTap: () {
                              provider
                                  .toggleNotifications();
                            },
                          ),
                        ],
                      ),

                      spaceHeight(20),

                      /// AUTO CONNECT

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [

                          Row(
                            children: [

                              const Icon(
                                LucideIcons
                                    .shield,
                                color: Color(
                                  0xff00E5FF,
                                ),
                                size: 22,
                              ),

                              spaceWidth(14),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: const [
                                  Text(
                                    "Auto Connect",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,
                                      fontSize:
                                      15,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    3,
                                  ),

                                  Text(
                                    "Connect to favorite avatars",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white60,
                                      fontSize:
                                      11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          _customSwitch(
                            value: provider
                                .autoConnect,
                            activeGradient:
                            const [
                              Color(
                                0xffFFC107,
                              ),
                              Color(
                                0xffFF4FD8,
                              ),
                            ],
                            onTap: () {
                              provider
                                  .toggleAutoConnect();
                            },
                          ),
                        ],
                      ),

                      spaceHeight(18),

                      /// LANGUAGE

                      Container(
                        padding:
                        const EdgeInsets.all(
                          14,
                        ),
                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            18,
                          ),
                          color: Colors.white
                              .withOpacity(
                            0.04,
                          ),
                          border: Border.all(
                            color: Colors.white
                                .withOpacity(
                              0.08,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [

                            const Icon(
                              LucideIcons
                                  .globe,
                              color: Color(
                                0xff7B61FF,
                              ),
                              size: 22,
                            ),

                            spaceWidth(14),

                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: const [
                                Text(
                                  "Language",
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize:
                                    15,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                  ),
                                ),

                                SizedBox(
                                  height:
                                  3,
                                ),

                                Text(
                                  "English (US)",
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .white60,
                                    fontSize:
                                    11,
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

                spaceHeight(20),

                _glassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [

                      const Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                      spaceHeight(18),

                      _aboutTile(
                        title: "Version",
                        value: "1.0.0",
                      ),

                      spaceHeight(14),

                      _aboutTile(
                        title: "Build",
                        value: "2026.05.13",
                      ),
                    ],
                  ),
                ),

                spaceHeight(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _aboutTile({
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// ------------------------------------------------
  /// CUSTOM SWITCH
  /// ------------------------------------------------

  Widget _customSwitch({
    required bool value,
    required List<Color> activeGradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),
        width: 52,
        height: 28,
        padding:
        const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(40),
          gradient: value
              ? LinearGradient(
            colors: activeGradient,
          )
              : null,
          color:
          value ? null : Colors.grey[700],
        ),
        child: AnimatedAlign(
          duration:
          const Duration(milliseconds: 250),
          alignment: value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  /// ------------------------------------------------
  /// GLASS CARD
  /// ------------------------------------------------

  Widget _glassCard({
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
            Colors.white.withOpacity(0.05),
            borderRadius:
            BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white
                  .withOpacity(0.08),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

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
}