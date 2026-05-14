import 'dart:ui';

import 'package:ai_chat_bot_app/features/screens/profile_details/profile_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final provider =
    context.watch<
        ProfileDetailsProvider>();

    return Scaffold(
      backgroundColor:
      AppColors.appMode,

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),

          child: SingleChildScrollView(
            physics:
            const BouncingScrollPhysics(),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                /// --------------------------------
                /// HEADER
                /// --------------------------------

                Row(
                  children: [

                    _glassButton(
                      icon:
                      LucideIcons
                          .arrowLeft,
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                    ),

                    spaceWidth(14),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: const [

                        Text(
                          "Profile Details",
                          style:
                          TextStyle(
                            color: Colors
                                .white,
                            fontSize: 24,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        SizedBox(
                          height: 4,
                        ),

                        Text(
                          "Manage your profile",
                          style:
                          TextStyle(
                            color:
                            Colors
                                .white60,
                            fontSize:
                            13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                spaceHeight(28),

                /// --------------------------------
                /// PROFILE CARD
                /// --------------------------------

                _glassCard(
                  glowColor:
                  const Color(
                    0xff00E5FF,
                  ),

                  child: Column(
                    children: [

                      /// AVATAR

                      Stack(
                        children: [

                          Container(
                            width: 100,
                            height: 100,

                            alignment:
                            Alignment
                                .center,

                            decoration:
                            BoxDecoration(
                              shape:
                              BoxShape
                                  .circle,

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

                              boxShadow: [
                                BoxShadow(
                                  blurRadius:
                                  35,
                                  color: const Color(
                                    0xff00E5FF,
                                  ).withOpacity(
                                    0.45,
                                  ),
                                ),
                              ],
                            ),

                            child: Text(
                              provider.user[
                              'image'],
                              style:
                              const TextStyle(
                                fontSize:
                                42,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 4,
                            right: 4,

                            child: Container(
                              padding:
                              const EdgeInsets.all(
                                6,
                              ),

                              decoration:
                              const BoxDecoration(
                                shape:
                                BoxShape
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

                              child:
                              const Icon(
                                LucideIcons
                                    .crown,
                                color:
                                Colors
                                    .white,
                                size:
                                14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      spaceHeight(18),

                      /// NAME

                      Text(
                        provider.user[
                        'name'],

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

                      spaceHeight(8),

                      /// MEMBERSHIP

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),

                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            40,
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

                          children: [

                            const Icon(
                              LucideIcons
                                  .crown,
                              color:
                              Colors
                                  .white,
                              size:
                              14,
                            ),

                            spaceWidth(6),

                            Text(
                              provider.user[
                              'membership'],

                              style:
                              const TextStyle(
                                color:
                                Colors
                                    .white,
                                fontWeight:
                                FontWeight
                                    .w600,
                                fontSize:
                                12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      spaceHeight(22),

                      /// DETAILS

                      _detailTile(
                        icon:
                        LucideIcons
                            .mail,
                        title: "Email",
                        value:
                        provider.user[
                        'email'],
                      ),

                      spaceHeight(16),

                      _detailTile(
                        icon:
                        LucideIcons
                            .phone,
                        title: "Phone",
                        value:
                        provider.user[
                        'phone'],
                      ),

                      spaceHeight(16),

                      _detailTile(
                        icon:
                        LucideIcons
                            .mapPin,
                        title:
                        "Location",
                        value:
                        provider.user[
                        'location'],
                      ),

                      spaceHeight(16),

                      _detailTile(
                        icon:
                        LucideIcons
                            .user,
                        title: "Bio",
                        value:
                        provider.user[
                        'bio'],
                      ),

                      spaceHeight(24),

                      /// EDIT BUTTON

                      GestureDetector(
                        onTap: () {},

                        child: Container(
                          width:
                          double.infinity,

                          alignment:
                          Alignment
                              .center,

                          padding:
                          const EdgeInsets.symmetric(
                            vertical: 15,
                          ),

                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(
                              18,
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

                            boxShadow: [
                              BoxShadow(
                                blurRadius:
                                25,
                                color: const Color(
                                  0xff00E5FF,
                                ).withOpacity(
                                  0.35,
                                ),
                              ),
                            ],
                          ),

                          child: Row(
                            mainAxisSize:
                            MainAxisSize
                                .min,

                            children: [

                              const Icon(
                                LucideIcons
                                    .edit,
                                color:
                                Colors
                                    .white,
                                size:
                                18,
                              ),

                              spaceWidth(
                                8,
                              ),

                              const Text(
                                "Edit Profile",
                                style:
                                TextStyle(
                                  color:
                                  Colors
                                      .white,
                                  fontSize:
                                  15,
                                  fontWeight:
                                  FontWeight
                                      .w600,
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

                      final item =
                      provider
                          .stats[
                      index];

                      return Expanded(
                        child: Padding(
                          padding:
                          EdgeInsets.only(
                            right: index !=
                                provider
                                    .stats
                                    .length -
                                    1
                                ? 12
                                : 0,
                          ),

                          child: _glassCard(
                            child: Column(
                              children: [

                                Text(
                                  item[
                                  'value'],

                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .white,
                                    fontSize:
                                    24,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),

                                spaceHeight(
                                  8,
                                ),

                                Text(
                                  item[
                                  'title'],

                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .white60,
                                    fontSize:
                                    12,
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

                spaceHeight(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Container(
          padding:
          const EdgeInsets.all(10),

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              14,
            ),

            color: Colors.white
                .withOpacity(0.05),

            border: Border.all(
              color: Colors.white
                  .withOpacity(0.08),
            ),
          ),

          child: Icon(
            icon,
            color:
            const Color(0xff00E5FF),
            size: 18,
          ),
        ),

        spaceWidth(14),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment
                .start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),

              spaceHeight(4),

              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _glassCard({
    required Widget child,
    Color? glowColor,
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
          width: double.infinity,

          padding:
          const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color:
            Colors.white.withOpacity(
              0.05,
            ),

            borderRadius:
            BorderRadius.circular(
              28,
            ),

            border: Border.all(
              color: Colors.white
                  .withOpacity(
                0.08,
              ),
            ),

            boxShadow: [

              BoxShadow(
                blurRadius: 25,
                spreadRadius: 1,
                color: Colors.black
                    .withOpacity(
                  0.25,
                ),
              ),

              if (glowColor != null)
                BoxShadow(
                  blurRadius: 35,
                  color: glowColor
                      .withOpacity(
                    0.18,
                  ),
                ),
            ],
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
        BorderRadius.circular(
          16,
        ),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),

          child: Container(
            padding:
            const EdgeInsets.all(
              12,
            ),

            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(
                0.05,
              ),

              borderRadius:
              BorderRadius.circular(
                16,
              ),

              border: Border.all(
                color: Colors.white
                    .withOpacity(
                  0.08,
                ),
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