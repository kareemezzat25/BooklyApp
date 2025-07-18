import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/features/home/models/price_book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsButtons extends StatelessWidget {
  final PriceBookModel? bookPrice;
  final void Function()? onPressed;
  const BookDetailsButtons({super.key, this.bookPrice, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              bookPrice == null || bookPrice!.amount == 0
                  ? "Free"
                  : "${bookPrice?.amount ?? 0} ${bookPrice!.currencyCode}",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.textButtonColor,
              minimumSize: Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            child: Text(
              "Free Preview",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
