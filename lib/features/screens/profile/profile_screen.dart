import 'dart:ui';

import 'package:ai_chat_bot_app/features/screens/profile/profile_provider.dart';
import 'package:ai_chat_bot_app/routes/route_names.dart';
import 'package:base_module/core/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<ProfileProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Manage your account",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              spaceHeight(24),

              _glassCard(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration:
                              const BoxDecoration(
                                shape:
                                BoxShape.circle,
                                gradient:
                                LinearGradient(
                                  colors: [
                                    Color(
                                      0xff00E5FF,
                                    ),
                                    Color(
                                      0xff7B61FF,
                                    ),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "👤",
                                  style:
                                  TextStyle(
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding:
                                const EdgeInsets
                                    .all(6),
                                decoration:
                                const BoxDecoration(
                                  shape: BoxShape
                                      .circle,
                                  gradient:
                                  LinearGradient(
                                    colors: [
                                      Color(
                                        0xffFFC107,
                                      ),
                                      Color(
                                        0xffFF4FD8,
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  LucideIcons.crown,
                                  size: 14,
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        spaceWidth(16),

                        /// USER INFO

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [

                              const Text(
                                "Alex Johnson",
                                style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 22,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              spaceHeight(8),

                              Row(
                                children: const [
                                  Icon(
                                    LucideIcons.mail,
                                    size: 16,
                                    color: Colors
                                        .white54,
                                  ),

                                  SizedBox(width: 8),

                                  Expanded(
                                    child: Text(
                                      "alex.johnson@email.com",
                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white60,
                                        fontSize:
                                        13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              spaceHeight(12),

                              Container(
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal:
                                  14,
                                  vertical: 8,
                                ),
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    30,
                                  ),
                                  gradient:
                                  const LinearGradient(
                                    colors: [
                                      Color(
                                        0xff00E5FF,
                                      ),
                                      Color(
                                        0xff7B61FF,
                                      ),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize:
                                  MainAxisSize
                                      .min,
                                  children: const [
                                    Icon(
                                      LucideIcons
                                          .crown,
                                      size: 14,
                                      color: Colors
                                          .white,
                                    ),

                                    SizedBox(
                                      width: 6,
                                    ),

                                    Text(
                                      "Pro Member",
                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white,
                                        fontSize:
                                        12,
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    spaceHeight(22),

                    /// EDIT PROFILE

                    GestureDetector(
                      onTap: ()=> provider.navigateTo(context, RouteNames.profileDetailsScreen),
                      child: Container(
                        width: double.infinity,
                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            18,
                          ),
                          color: Colors.white
                              .withOpacity(
                            0.05,
                          ),
                          border: Border.all(
                            color: Colors.white
                                .withOpacity(
                              0.08,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: const [
                            Icon(
                              LucideIcons.edit,
                              color: Colors.white,
                              size: 18,
                            ),

                            SizedBox(width: 10),

                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                color:
                                Colors.white,
                                fontWeight:
                                FontWeight
                                    .w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              spaceHeight(22),

              Row(
                children: List.generate(
                  provider.stats.length,
                      (index) {
                    final stat =
                    provider.stats[index];

                    return Expanded(
                      child: Padding(
                        padding:
                        EdgeInsets.only(
                          right: index != 2
                              ? 10
                              : 0,
                        ),
                        child: _glassCard(
                          child: Column(
                            children: [
                              Text(
                                stat["value"],
                                style:
                                const TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 24,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              spaceHeight(6),

                              Text(
                                stat["label"],
                                textAlign:
                                TextAlign
                                    .center,
                                style:
                                const TextStyle(
                                  color: Colors
                                      .white60,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              spaceHeight(24),

              /// ---------------- SETTINGS ----------------

              _glassCard(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Account Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),

                    spaceHeight(18),

                    _settingsTile(
                      icon: LucideIcons.shield,
                      iconColor:
                      const Color(0xff00E5FF),
                      title: "Privacy & Security",
                      onTap: () {},
                    ),

                    spaceHeight(14),

                    _settingsTile(
                      icon: LucideIcons.crown,
                      iconColor:
                      const Color(0xffFFC107),
                      title: "Subscription",
                      onTap: ()=> provider.navigateTo(context, RouteNames.subscriptionScreen),
                    ),

                    spaceHeight(14),

                    _settingsTile(
                      icon: LucideIcons.logOut,
                      iconColor:
                      const Color(0xffFF4FD8),
                      title: "Logout",
                      onTap: () => AppDialogs.showLogoutDialog(context, RouteNames.signInScreen),
                    ),
                  ],
                ),
              ),

              spaceHeight(24),
              _glassCard(
                child: Column(
                  children: [

                    /// NOTIFICATION

                    SwitchListTile(
                      value:
                      provider.notificationEnabled,
                      onChanged:
                      provider
                          .toggleNotification,
                      activeColor:
                      const Color(0xff00E5FF),
                      contentPadding:
                      EdgeInsets.zero,
                      title: const Text(
                        "Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text(
                        "Enable push notifications",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Divider(
                      color: Colors.white
                          .withOpacity(0.08),
                    ),

                    /// DARK MODE

                    SwitchListTile(
                      value:
                      provider.darkModeEnabled,
                      onChanged:
                      provider.toggleDarkMode,
                      activeColor:
                      const Color(0xff7B61FF),
                      contentPadding:
                      EdgeInsets.zero,
                      title: const Text(
                        "Dark Mode",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text(
                        "Enable dark theme",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
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

  /// ------------------------------------------------
  /// GLASS CARD
  /// ------------------------------------------------

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
  /// SETTINGS TILE
  /// ------------------------------------------------

  Widget _settingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(18),
          color: Colors.white.withOpacity(
            0.04,
          ),
          border: Border.all(
            color:
            Colors.white.withOpacity(0.08),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),

            spaceWidth(14),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight:
                  FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              LucideIcons.chevronRight,
              color: Colors.white38,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
