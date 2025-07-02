import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookImage(),
        SizedBox(height: 42),
        Text("The Jungle Book", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
