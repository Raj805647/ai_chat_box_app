import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'notification_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final provider =
    context.watch<
        NotificationProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment
                .start,

            children: [

              Row(
                children: [

                  _glassButton(
                    icon:
                    LucideIcons.arrowLeft,
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

                    children: [

                      const Text(
                        "Notifications",
                        style: TextStyle(
                          color:
                          Colors.white,
                          fontSize: 24,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),

                      spaceHeight(4),

                      Text(
                        "${provider.notifications.length} new updates",
                        style:
                        const TextStyle(
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
              Expanded(
                child: ListView.separated(
                  physics:
                  const BouncingScrollPhysics(),

                  itemCount: provider
                      .notifications
                      .length,

                  separatorBuilder:
                      (_, __) =>
                      spaceHeight(14),

                  itemBuilder:
                      (context, index) {

                    final item =
                    provider
                        .notifications[
                    index];

                    return _glassCard(
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          /// ICON BOX

                          Container(
                            padding:
                            const EdgeInsets.all(
                              12,
                            ),

                            decoration:
                            BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                18,
                              ),

                              gradient:
                              LinearGradient(
                                colors: [
                                  (item['color']
                                  as Color)
                                      .withOpacity(
                                    0.35,
                                  ),

                                  (item['color']
                                  as Color)
                                      .withOpacity(
                                    0.15,
                                  ),
                                ],
                              ),

                              border:
                              Border.all(
                                color:
                                (item['color']
                                as Color)
                                    .withOpacity(
                                  0.25,
                                ),
                              ),
                            ),

                            child: Icon(
                              item['icon'],
                              color:
                              item['color'],
                              size: 22,
                            ),
                          ),

                          spaceWidth(14),

                          /// CONTENT

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  item['title'],
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .white,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                    fontSize:
                                    15,
                                  ),
                                ),

                                spaceHeight(6),

                                Text(
                                  item['message'],
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .white60,
                                    fontSize:
                                    13,
                                  ),
                                ),

                                spaceHeight(10),

                                Text(
                                  item['time'],
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .white38,
                                    fontSize:
                                    11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              spaceHeight(18),

              /// --------------------------------
              /// CLEAR BUTTON
              /// --------------------------------

              GestureDetector(
                onTap: () {
                  provider
                      .clearAllNotifications();
                },

                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                    18,
                  ),

                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),

                    child: Container(
                      width: double.infinity,
                      alignment:
                      Alignment.center,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      decoration:
                      BoxDecoration(
                        color: Colors.white
                            .withOpacity(
                          0.05,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          18,
                        ),

                        border: Border.all(
                          color: const Color(
                            0xff00E5FF,
                          ).withOpacity(
                            0.20,
                          ),
                        ),
                      ),

                      child: const Text(
                        "Clear All",
                        style: TextStyle(
                          color:
                          Colors.white,
                          fontSize: 15,
                          fontWeight:
                          FontWeight
                              .w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              spaceHeight(20),
            ],
          ),
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

  Widget _glassCard({
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(26),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),

        child: Container(
          padding:
          const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color:
            Colors.white.withOpacity(
              0.05,
            ),

            borderRadius:
            BorderRadius.circular(
              26,
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
            ],
          ),

          child: child,
        ),
      ),
    );
  }
}