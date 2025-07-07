import 'package:bookly_app/core/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/models/book_rating_model.dart';
import 'package:bookly_app/features/home/models/newest_book_model.dart';
import 'package:bookly_app/features/home/models/price_book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/newest_books/newest_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookStates>(
      builder: (context, state) {
        if (state is NewestBookLoadingState) {
          return CustomLoadingWidget();
        } else if (state is NewestBookSuccessState) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BestSellerItem(
                book: NewestBookModel(
                  image:
                      state
                          .bookModel
                          ?.items?[index]
                          .volumeInfo
                          ?.imageLinks
                          ?.thumbnail ??
                      "",
                  title: state.bookModel?.items?[index].volumeInfo?.title ?? "",
                  author:
                      state
                          .bookModel
                          ?.items?[index]
                          .volumeInfo
                          ?.authors
                          ?.first ??
                      "",
                ),
                bookRating: BookRatingModel(
                  ratingAverage:
                      state
                          .bookModel
                          ?.items?[index]
                          .volumeInfo
                          ?.averageRating ??
                      0,
                  ratingCount:
                      state.bookModel?.items?[index].volumeInfo?.ratingsCount ??
                      0,
                ),
                bookPrice:
                    state.bookModel?.items?[index].saleInfo?.saleability !=
                        "FREE"
                    ? PriceBookModel(
                        amount:
                            state
                                .bookModel
                                ?.items?[index]
                                .saleInfo
                                ?.listPrice
                                ?.amount ??
                            0,
                        currencyCode:
                            state
                                .bookModel
                                ?.items?[index]
                                .saleInfo
                                ?.listPrice
                                ?.currencyCode ??
                            "",
                      )
                    : null,
              );
            },
            itemCount: state.bookModel?.totalItems ?? 0,
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
          );
        } else if (state is NewestBookFailureState) {
          return CustomFailureWidget(errorMessage: state.errMessage);
        } else {
          return CustomFailureWidget(errorMessage: "SomeThing Went Wrong");
        }
      },
    );
  }
}
