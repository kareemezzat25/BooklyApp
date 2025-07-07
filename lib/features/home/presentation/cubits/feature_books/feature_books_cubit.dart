import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/feature_books/feature_books_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeatureBooksCubit extends Cubit<FeatureBooksStates> {
  HomeRepo homeRepo;
  FeatureBooksCubit({required this.homeRepo})
    : super(FeatureBooksInitialState());

  fetchFeatureBooks() async {
    emit(FeatureBooksLoadingState());
    var result = await homeRepo.fetchFeatureBooks();

    result.fold(
      (failure) {
        log("Error ${failure.message}");
        emit(FeatureBookFailureState(errMessage: failure.message));
      },
      (book) {
        log("Success");
        emit(FeatureBookSuccessState(bookModel: book));
      },
    );
  }
}
