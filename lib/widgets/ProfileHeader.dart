// profile_header.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routing/app_router.dart';

class ProfileHeader extends ConsumerWidget implements PreferredSizeWidget {
  final IconData iconData;
  final VoidCallback? onIconTap;

  const ProfileHeader({
    Key? key,
    required this.iconData,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[400],
                child: const Icon(
                  Icons.person, // 사람 모양 아이콘
                  size: 32, // 아이콘 크기 조절
                  color: Colors.white, // 아이콘 색상
                ), // 배경색 (아이콘이 더 잘 보이도록)
              ),
              const SizedBox(width: 12),
              const Text(
                "Welcome\nEvelyn",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              if (onIconTap != null) {
                onIconTap!();
              } else {
                // Default behavior if no callback is provided
                ref.read(goRouterProvider).go('/login');
              }
            },
            child: Icon(iconData, size: 28, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0); // Adjust height as needed
}