import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/newest_books/newest_books_states.dart';

class NewestBookCubit extends Cubit<NewestBookStates> {
  HomeRepo homeRepo;
  BookModel? book;
  NewestBookCubit({required this.homeRepo}) : super(NewestBookInitialState());
  fetchNewestBooks() async {
    emit(NewestBookLoadingState());
    var result = await homeRepo.fetchNewestBooks();

    result.fold(
      (failure) {
        emit(NewestBookFailureState(errMessage: failure.message));
      },
      (book) {
        book = book;
        emit(NewestBookSuccessState());
      },
    );
  }
}
