import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class ProfileDetailsProvider extends BaseProvider{
  final Map<String, dynamic> user = {

    'name': 'Alex Johnson',

    'email':
    'alex.johnson@email.com',

    'phone':
    '+1 234 567 890',

    'bio':
    'AI enthusiast and premium member exploring futuristic AI avatars and smart conversations.',

    'location':
    'California, USA',

    'membership':
    'Pro Member',

    'image': '👤',
  };

  final List<Map<String, dynamic>>
  stats = [

    {
      'title': 'Calls',
      'value': '47',
      'color': const Color(
        0xff00E5FF,
      ),
    },

    {
      'title': 'Messages',
      'value': '1.2K',
      'color': const Color(
        0xffFF4FD8,
      ),
    },

    {
      'title': 'Favorites',
      'value': '05',
      'color': const Color(
        0xffFFC107,
      ),
    },
  ];
}