import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo.dart';
import 'package:bookly_app/features/home/presentation/cubits/newest_books/newest_books_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewestBookCubit extends Cubit<NewestBookStates> {
  HomeRepo homeRepo;
  NewestBookCubit({required this.homeRepo}) : super(NewestBookInitialState());
  fetchNewestBooks() async {
    emit(NewestBookLoadingState());
    var result = await homeRepo.fetchNewestBooks();

    result.fold(
      (failure) {
        log("Error ${failure.message}");
        emit(NewestBookFailureState(errMessage: failure.message));
      },
      (book) {
        log("Success");
        emit(NewestBookSuccessState(bookModel: book));
      },
    );
  }
}
