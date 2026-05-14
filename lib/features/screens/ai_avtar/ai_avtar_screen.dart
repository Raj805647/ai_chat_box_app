import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widget/help_widget.dart';
import 'ai_avtar_provider.dart';

class AiAvtarScreen extends StatelessWidget {
  const AiAvtarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.watch<AiAvtarProvider>();

    return Scaffold(
      backgroundColor: AppColors.appMode,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    "AI Avatars",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  spaceHeight(4),

                  Text(
                    "${provider.filteredAvatars.length} avatars available",
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              spaceHeight(24),
              ClipRRect(
                borderRadius:
                BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(
                        0.05,
                      ),
                      borderRadius:
                      BorderRadius.circular(18),
                      border: Border.all(
                        color:
                        Colors.white.withOpacity(
                          0.08,
                        ),
                      ),
                    ),
                    child: TextField(
                      controller:
                      provider.searchController,
                      onChanged:
                      provider.updateSearch,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          LucideIcons.search,
                          color: Colors.white60,
                        ),
                        hintText:
                        "Search avatars...",
                        hintStyle: TextStyle(
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              spaceHeight(20),

              /// ---------------- FILTERS ----------------

              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection:
                  Axis.horizontal,
                  itemCount:
                  provider.categories.length,
                  separatorBuilder:
                      (_, __) => spaceWidth(10),
                  itemBuilder: (context, index) {
                    final category =
                    provider.categories[index];

                    final bool isSelected =
                        provider.selectedCategory ==
                            category;

                    return GestureDetector(
                      onTap: () {
                        provider.selectCategory(
                          category,
                        );
                      },
                      child: AnimatedContainer(
                        duration:
                        const Duration(
                          milliseconds: 250,
                        ),
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                          gradient: isSelected
                              ? const LinearGradient(
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
                          color: isSelected
                              ? null
                              : Colors.white
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
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.white70,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              spaceHeight(24),

              /// ---------------- AVATARS GRID ----------------

              provider.filteredAvatars.isEmpty
                  ? _emptyWidget(provider)
                  : GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: provider
                    .filteredAvatars
                    .length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder:
                    (context, index) {
                  final avatar = provider
                      .filteredAvatars[index];

                  return _avatarCard(
                    avatar: avatar,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ------------------------------------------------
  /// AVATAR CARD
  /// ------------------------------------------------

  Widget _avatarCard({
    required Map<String, dynamic> avatar,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(14),
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
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// AVATAR IMAGE

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: avatar["colors"],
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 18,
                        color:
                        (avatar["colors"][0]
                        as Color)
                            .withOpacity(
                          0.35,
                        ),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [

                      /// ONLINE DOT

                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            avatar["online"]
                                ? Colors.green
                                : Colors.red,
                            border: Border.all(
                              color:
                              Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Text(
                          avatar["emoji"],
                          style:
                          const TextStyle(
                            fontSize: 48,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              spaceHeight(14),

              /// NAME + RATING

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
                        color: Colors.amber,
                      ),

                      spaceWidth(4),

                      Text(
                        avatar["rating"],
                        style: const TextStyle(
                          color: Colors.white,
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

              spaceHeight(14),

              /// ACTION BUTTONS

              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      icon:
                      LucideIcons.messageCircle,
                      label: "Chat",
                    ),
                  ),

                  spaceWidth(10),

                  Expanded(
                    child: _actionButton(
                      icon: LucideIcons.phone,
                      label: "Call",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ------------------------------------------------
  /// ACTION BUTTON
  /// ------------------------------------------------

  Widget _actionButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(14),
        color: Colors.white.withOpacity(
          0.05,
        ),
        border: Border.all(
          color:
          Colors.white.withOpacity(0.08),
        ),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.white,
          ),

          spaceWidth(6),

          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyWidget(
      AiAvtarProvider provider,
      ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            const Text(
              "No avatars found",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),

            spaceHeight(20),

            GestureDetector(
              onTap: provider.clearFilters,
              child: Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(16),
                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xff00E5FF),
                      Color(0xff7B61FF),
                    ],
                  ),
                ),
                child: const Text(
                  "Clear Filters",
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
    );
  }

  Widget _glassIconButton({
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