import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarBookDetails extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: IconButton(
          icon: Icon(Icons.close, color: AppColors.secondary, size: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.secondary,
            size: 32,
          ),
        ),
      ],
    );
  }
}
