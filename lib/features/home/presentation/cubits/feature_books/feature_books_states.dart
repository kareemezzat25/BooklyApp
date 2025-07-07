import 'package:bookly_app/features/home/models/book_model.dart';

abstract class FeatureBooksStates {}

class FeatureBooksInitialState extends FeatureBooksStates {}

class FeatureBooksLoadingState extends FeatureBooksStates {}

class FeatureBookSuccessState extends FeatureBooksStates {
  BookModel? bookModel;
  FeatureBookSuccessState({required this.bookModel});
}

class FeatureBookFailureState extends FeatureBooksStates {
  String errMessage;
  FeatureBookFailureState({required this.errMessage});
}
