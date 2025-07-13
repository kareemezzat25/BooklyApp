import 'package:bookly_app/features/home/models/book_model.dart';

abstract class SimilarBooksStates {}

class SimilarBooksInitialState extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksFailureState extends SimilarBooksStates {
  String errorMessage;
  SimilarBooksFailureState({required this.errorMessage});
}

class SimilarBooksSuccessState extends SimilarBooksStates {
  BookModel books;
  SimilarBooksSuccessState({required this.books});
}
