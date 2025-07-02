import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBarBookDetails());
  }
}
