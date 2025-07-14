import 'package:bookly_app/di.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_body.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar_book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  Items? bookItems;
  BookDetailsView({super.key, this.bookItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SimilarBooksCubit>(),
      child: Scaffold(
        appBar: CustomAppBarBookDetails(),
        body: BookDetailsBody(bookItems: bookItems),
      ),
    );
  }
}
