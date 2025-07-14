import 'package:bookly_app/core/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books/similar_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBooksLoadingState) {
          return CustomLoadingWidget();
        } else if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BookImage(
                  height: 160,
                  width: 120,
                  image:
                      state
                          .books
                          .items?[index]
                          .volumeInfo
                          ?.imageLinks
                          ?.thumbnail ??
                      "",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemCount: state.books.items?.length ?? 0,
            ),
          );
        } else if (state is SimilarBooksFailureState) {
          return CustomFailureWidget(errorMessage: state.errorMessage);
        } else {
          return CustomFailureWidget(errorMessage: "SomeThing Went Wrong");
        }
      },
    );
  }
}
