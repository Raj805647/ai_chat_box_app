import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'ai_chating_provider.dart';

class AiChattingScreen extends StatelessWidget {
  const AiChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<AiChattingProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
              ),
              child: Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                        16,
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
                      size: 22,
                    ),
                  ),
                  spaceWidth(12),

                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "AI Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            spaceHeight(20),

            /// ---------------- CHAT LIST ----------------

            Expanded(
              child: ListView.builder(
                controller:
                provider.scrollController,
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount:
                provider.messages.length,
                itemBuilder: (context, index) {
                  final message =
                  provider.messages[index];

                  final bool isUser =
                  message["isUser"];

                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin:
                      const EdgeInsets.only(
                        bottom: 14,
                      ),
                      padding:
                      const EdgeInsets.all(
                        14,
                      ),
                      constraints:
                      const BoxConstraints(
                        maxWidth: 300,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                          22,
                        ),

                        gradient: isUser
                            ? const LinearGradient(
                          begin:
                          Alignment
                              .topLeft,
                          end:
                          Alignment
                              .bottomRight,
                          colors: [
                            Color(
                              0xff00E5FF,
                            ),
                            Color(
                              0xff7B61FF,
                            ),
                          ],
                        )
                            : null,

                        color: isUser
                            ? null
                            : Colors.white
                            .withOpacity(
                          0.05,
                        ),

                        border: isUser
                            ? null
                            : Border.all(
                          color: Colors
                              .white
                              .withOpacity(
                            0.08,
                          ),
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [

                          /// MESSAGE

                          Text(
                            message["message"],
                            style:
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),

                          spaceHeight(6),

                          /// TIME

                          Text(
                            provider.formatTime(
                              message["time"],
                            ),
                            style:
                            TextStyle(
                              color: Colors.white
                                  .withOpacity(
                                0.65,
                              ),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// ---------------- INPUT AREA ----------------

            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom:
                MediaQuery.of(context)
                    .viewInsets
                    .bottom +
                    16,
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20,
                    sigmaY: 20,
                  ),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(
                        0.05,
                      ),
                      borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                      border: Border.all(
                        color:
                        Colors.white.withOpacity(
                          0.08,
                        ),
                      ),
                    ),

                    child: Row(
                      children: [

                        /// TEXTFIELD

                        Expanded(
                          child: TextField(
                            controller: provider
                                .messageController,
                            style:
                            const TextStyle(
                              color:
                              Colors.white,
                            ),
                            textInputAction:
                            TextInputAction
                                .send,
                            onSubmitted: (_) {
                              provider
                                  .sendMessage();
                            },
                            decoration:
                            const InputDecoration(
                              border:
                              InputBorder.none,
                              hintText:
                              "Type a message...",
                              hintStyle:
                              TextStyle(
                                color:
                                Colors.white38,
                              ),
                            ),
                          ),
                        ),

                        spaceWidth(10),

                        /// SEND BUTTON

                        GestureDetector(
                          onTap: () {
                            provider
                                .sendMessage();
                          },
                          child: Container(
                            padding:
                            const EdgeInsets.all(
                              12,
                            ),
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
                            child: const Icon(
                              LucideIcons.send,
                              color:
                              Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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