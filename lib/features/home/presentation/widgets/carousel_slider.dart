import 'package:bookly_app/core/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/cubits/feature_books/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/feature_books/feature_books_states.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselSliderBooks extends StatelessWidget {
  const CarouselSliderBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksStates>(
      builder: (context, state) {
        if (state is FeatureBooksLoadingState) {
          return CustomLoadingWidget();
        } else if (state is FeatureBookSuccessState) {
          return state.bookModel?.totalItems != 0
              ? CarouselSlider(
                  options: CarouselOptions(
                    height: 260.0,
                    autoPlay: true,
                    viewportFraction: 0.48,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 600),
                  ),

                  items: state.bookModel?.items!.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return BookImage(
                          height: 260,
                          width: 180,
                          image: item.volumeInfo?.imageLinks?.thumbnail ?? "",
                        );
                      },
                    );
                  }).toList(),
                )
              : Center(
                  child: CustomFailureWidget(errorMessage: "No Data Exist"),
                );
        } else if (state is FeatureBookFailureState) {
          return CustomFailureWidget(errorMessage: state.errMessage);
        }
        return CustomFailureWidget(errorMessage: "SomeThing Went Wrong");
      },
    );
  }
}
