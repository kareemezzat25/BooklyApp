import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, BookModel>> fetchNewestBooks();
  Future<Either<Failures, BookModel>> fetchFeatureBooks();
  Future<Either<Failures, BookModel>> fetchSimilarBooks({
    required String category,
  });
}
