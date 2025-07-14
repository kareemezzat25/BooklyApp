import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/models/price_book_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_buttons.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final Items bookItems;
  const BookDetailsSection({super.key, required this.bookItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookImage(
          height: 320,
          width: 200,
          image: bookItems.volumeInfo?.imageLinks?.thumbnail ?? "",
        ),
        SizedBox(height: 42),
        Text(
          bookItems.volumeInfo?.title ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 6),
        Text(
          bookItems.volumeInfo?.authors?[0] ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 18),
        // Center(child: BookRating()),
        SizedBox(height: 36),
        BookDetailsButtons(
          bookPrice: bookItems.saleInfo?.saleability != "FREE"
              ? PriceBookModel(
                  amount: bookItems.saleInfo?.listPrice?.amount ?? 0,
                  currencyCode:
                      bookItems.saleInfo?.listPrice?.currencyCode ?? "",
                )
              : null,
        ),
      ],
    );
  }
}
