import 'dart:developer';

import 'package:bookly_app/features/home/data/home_repo.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitialState());
  HomeRepo homeRepo;

  fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        log("Error");
        emit(SimilarBooksFailureState(errorMessage: failure.message));
      },
      (books) {
        log("Success");
        emit(SimilarBooksSuccessState(books: books));
      },
    );
  }
}
