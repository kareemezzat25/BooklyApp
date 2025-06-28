import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Image.asset(AppAssets.appLogo),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: AppColors.secondary, size: 32),
        ),
      ],
    );
  }
}
