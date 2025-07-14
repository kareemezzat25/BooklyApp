import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/models/book_rating_model.dart';
import 'package:bookly_app/features/home/models/newest_book_model.dart';
import 'package:bookly_app/features/home/models/price_book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellerItem extends StatelessWidget {
  final NewestBookModel? book;
  final BookRatingModel? bookRating;
  final PriceBookModel? bookPrice;
  final Items? bookItems;
  const BestSellerItem({
    super.key,
    required this.book,
    this.bookRating,
    this.bookPrice,
    this.bookItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookDetailsView(bookItems: bookItems),
          transition: Transition.fade,
        );
      },
      child: Row(
        children: [
          BookImage(height: 120, width: 85, image: book?.image ?? ""),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book?.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3),
                Text(
                  book?.author ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bookPrice == null || bookPrice!.amount == 0
                          ? "Free"
                          : "${bookPrice?.amount ?? 0} ${bookPrice!.currencyCode}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    BookRating(bookRating: bookRating!),
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
