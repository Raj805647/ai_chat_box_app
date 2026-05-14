import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class AiAvtarProvider extends BaseProvider{
  final TextEditingController searchController =
  TextEditingController();

  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Business",
    "Cute",
    "Fashion",
    "Gaming",
  ];

  final List<Map<String, dynamic>> avatars = [
    {
      "name": "Sophia",
      "emoji": "👩‍💼",
      "rating": "4.9",
      "personality": "Business Expert",
      "category": "Business",
      "online": true,
      "colors": [
        const Color(0xff00E5FF),
        const Color(0xff7B61FF),
      ],
    },
    {
      "name": "Nova",
      "emoji": "🎀",
      "rating": "4.8",
      "personality": "Cute & Friendly",
      "category": "Cute",
      "online": true,
      "colors": [
        const Color(0xffFF4FD8),
        const Color(0xff7B61FF),
      ],
    },
    {
      "name": "Zara",
      "emoji": "💃",
      "rating": "4.7",
      "personality": "Fashion Queen",
      "category": "Fashion",
      "online": false,
      "colors": [
        const Color(0xffFF9966),
        const Color(0xffFF5E62),
      ],
    },
    {
      "name": "Leo",
      "emoji": "🎮",
      "rating": "4.9",
      "personality": "Gaming Master",
      "category": "Gaming",
      "online": true,
      "colors": [
        const Color(0xff56CCF2),
        const Color(0xff2F80ED),
      ],
    },
  ];

  List<Map<String, dynamic>> get filteredAvatars {
    return avatars.where((avatar) {
      final search = searchController.text
          .toLowerCase();

      final matchesSearch = avatar["name"]
          .toLowerCase()
          .contains(search);

      final matchesCategory =
          selectedCategory == "All" ||
              avatar["category"] ==
                  selectedCategory;

      return matchesSearch &&
          matchesCategory;
    }).toList();
  }

  void updateSearch(String value) {
    notifyListeners();
  }

  void selectCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void clearFilters() {
    searchController.clear();
    selectedCategory = "All";
    notifyListeners();
  }
}
