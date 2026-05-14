import 'dart:ui';

import 'package:ai_chat_bot_app/features/screens/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// ---------------- HEADER ----------------

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
                    CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Subscription",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Choose your plan",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              spaceHeight(24),

              /// ---------------- PLANS ----------------

              Expanded(
                child: ListView.separated(
                  physics:
                  const BouncingScrollPhysics(),
                  itemCount:
                  provider.plans.length,
                  separatorBuilder:
                      (_, __) => spaceHeight(18),
                  itemBuilder: (context, index) {
                    final plan =
                    provider.plans[index];

                    final bool popular =
                    plan["popular"];

                    return TweenAnimationBuilder(
                      duration:
                      Duration(
                        milliseconds:
                        250 + (index * 100),
                      ),
                      tween: Tween(
                        begin: 0.0,
                        end: 1.0,
                      ),
                      builder:
                          (context, value, child) {
                        return Transform.translate(
                          offset:
                          Offset(0, 25 * (1 - value)),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },

                      child: _glassCard(
                        glow: popular
                            ? plan["color"]
                            : null,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [

                            /// POPULAR TAG

                            if (popular)
                              Container(
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal:
                                  12,
                                  vertical:
                                  6,
                                ),
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
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
                                      color:
                                      Colors
                                          .white,
                                      size: 13,
                                    ),

                                    SizedBox(
                                      width:
                                      6,
                                    ),

                                    Text(
                                      "Most Popular",
                                      style:
                                      TextStyle(
                                        color:
                                        Colors.white,
                                        fontSize:
                                        11,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            if (popular)
                              spaceHeight(18),

                            /// TOP

                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [

                                /// LEFT

                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [

                                    /// TITLE

                                    Row(
                                      children: [
                                        Icon(
                                          plan[
                                          "icon"],
                                          color:
                                          plan[
                                          "color"],
                                          size:
                                          26,
                                        ),

                                        spaceWidth(
                                          10,
                                        ),

                                        Text(
                                          plan[
                                          "name"],
                                          style:
                                          const TextStyle(
                                            color:
                                            Colors.white,
                                            fontSize:
                                            24,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    spaceHeight(
                                      14,
                                    ),

                                    /// PRICE

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .end,
                                      children: [
                                        Text(
                                          plan[
                                          "price"],
                                          style:
                                          const TextStyle(
                                            color:
                                            Colors.white,
                                            fontSize:
                                            34,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),

                                        spaceWidth(
                                          8,
                                        ),

                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                            bottom:
                                            6,
                                          ),
                                          child:
                                          Text(
                                            plan[
                                            "period"],
                                            style:
                                            const TextStyle(
                                              color:
                                              Colors.white60,
                                              fontSize:
                                              13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            spaceHeight(24),

                            /// FEATURES

                            Column(
                              children:
                              List.generate(
                                (plan["features"]
                                as List)
                                    .length,
                                    (featureIndex) {
                                  final feature =
                                  plan["features"]
                                  [
                                  featureIndex];

                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      bottom:
                                      12,
                                    ),
                                    child: Row(
                                      children: [

                                        /// CHECK ICON

                                        const Icon(
                                          LucideIcons
                                              .check,
                                          color:
                                          Color(
                                            0xff00E5FF,
                                          ),
                                          size:
                                          18,
                                        ),

                                        spaceWidth(
                                          10,
                                        ),

                                        Expanded(
                                          child:
                                          Text(
                                            feature,
                                            style:
                                            const TextStyle(
                                              color:
                                              Colors.white,
                                              fontSize:
                                              14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                            spaceHeight(14),

                            /// BUTTON

                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                    Colors
                                        .black,
                                    content: Text(
                                      plan["name"] ==
                                          "Free"
                                          ? "Current Plan"
                                          : "Upgrade to ${plan["name"]}",
                                    ),
                                  ),
                                );
                              },

                              child: Container(
                                width:
                                double.infinity,
                                padding:
                                const EdgeInsets.symmetric(
                                  vertical:
                                  16,
                                ),
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                    18,
                                  ),

                                  gradient:
                                  popular
                                      ? LinearGradient(
                                    colors:
                                    List<Color>.from(
                                      plan[
                                      "gradient"],
                                    ),
                                  )
                                      : null,

                                  color: popular
                                      ? null
                                      : Colors
                                      .white
                                      .withOpacity(
                                    0.05,
                                  ),

                                  border:
                                  popular
                                      ? null
                                      : Border.all(
                                    color: Colors
                                        .white
                                        .withOpacity(
                                      0.08,
                                    ),
                                  ),

                                  boxShadow:
                                  popular
                                      ? [
                                    BoxShadow(
                                      blurRadius:
                                      25,
                                      color:
                                      (plan["color"]
                                      as Color)
                                          .withOpacity(
                                        0.35,
                                      ),
                                    ),
                                  ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    plan["name"] ==
                                        "Free"
                                        ? "Current Plan"
                                        : "Upgrade Now",
                                    style:
                                    const TextStyle(
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
    Color? glow,
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
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color:
            Colors.white.withOpacity(0.05),
            borderRadius:
            BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white
                  .withOpacity(0.08),
            ),
            boxShadow: glow != null
                ? [
              BoxShadow(
                blurRadius: 28,
                color: glow.withOpacity(
                  0.22,
                ),
              ),
            ]
                : [],
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
}