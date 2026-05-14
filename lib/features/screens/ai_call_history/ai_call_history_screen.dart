import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'ai_call_history_provider.dart';

class AiCallHistoryScreen extends StatelessWidget {
  const AiCallHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AiCallHistoryProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "History",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      spaceHeight(4),

                      Text(
                        "${provider.history.length} recent activities",
                        style: const TextStyle(
                          color: Colors.white60,
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
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.history.length,
                  separatorBuilder: (_, __) => spaceHeight(14),
                  itemBuilder: (context, index) {
                    final item = provider.history[index];

                    final bool isCall = item["type"] == "call";

                    return TweenAnimationBuilder(
                      duration: Duration(milliseconds: 250 + (index * 100)),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },

                      child: _glassCard(
                        child: Row(
                          children: [
                            /// AVATAR BOX
                            Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    (item["color"] as Color).withOpacity(0.65),
                                    (item["color"] as Color).withOpacity(0.25),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    color: (item["color"] as Color).withOpacity(
                                      0.35,
                                    ),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  item["emoji"],
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ),
                            ),

                            spaceWidth(16),

                            /// DETAILS
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// NAME
                                  Text(
                                    item["avatar"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  spaceHeight(6),

                                  /// TYPE
                                  Row(
                                    children: [
                                      Icon(
                                        isCall
                                            ? LucideIcons.phone
                                            : LucideIcons.messageCircle,
                                        size: 14,
                                        color: isCall
                                            ? const Color(0xff00E5FF)
                                            : const Color(0xffFF4FD8),
                                      ),

                                      spaceWidth(6),

                                      Text(
                                        item["type"].toString().toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// RIGHT SIDE
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// DURATION
                                Text(
                                  item["duration"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                spaceHeight(6),

                                /// TIME
                                Row(
                                  children: [
                                    const Icon(
                                      LucideIcons.clock3,
                                      size: 12,
                                      color: Colors.white38,
                                    ),

                                    spaceWidth(4),

                                    Text(
                                      item["time"],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white.withOpacity(0.05),
                      border: Border.all(color: Colors.white.withOpacity(0.08)),
                    ),
                    child: const Center(
                      child: Text(
                        "Load More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: child,
        ),
      ),
    );
  }
  Widget _glassButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
