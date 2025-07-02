import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BookDetailsView(), transition: Transition.fade);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              AppAssets.testImage3,
              width: 80,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Last Memory A world forgetting its past",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3),
                Text(
                  "Ekaterina Pavlova",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "19.99\$",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.star, color: AppColors.starColor),
                        SizedBox(width: 6),
                        Text(
                          "4.8",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "(2430)",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
