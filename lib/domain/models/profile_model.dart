import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileOption {
  final String title;
  final String subtitle;
  final IconData icon;

  ProfileOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
    };
  }

  factory ProfileOption.fromJson(Map<String, dynamic> json) {
    return ProfileOption(
      title: json['title'],
      subtitle: json['subtitle'],
      icon: _getIconFromString(json['icon']),
    );
  }

  static IconData _getIconFromString(String iconString) {
    switch (iconString) {
      case "Bootstrap.person":
        return Bootstrap.person;
      case "Bootstrap.file-text":
        return Bootstrap.file_text;
      case "Bootstrap.lock":
        return Bootstrap.lock;
      case "Bootstrap.credit-card":
        return Bootstrap.credit_card;
      case "Bootstrap.map":
        return Bootstrap.map;
      case "Bootstrap.eye":
        return Bootstrap.eye;
      case "Bootstrap.bell":
        return Bootstrap.bell;
      default:
        return Icons.help;
    }
  }
}
