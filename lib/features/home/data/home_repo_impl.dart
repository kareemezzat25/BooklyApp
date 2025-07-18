import 'package:bookly_app/core/api/api_manager.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/home_repo.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  ApiManager apiManager;
  HomeRepoImpl({required this.apiManager});
  @override
  Future<Either<Failures, BookModel>> fetchNewestBooks() async {
    try {
      var result = await apiManager.getData(
        "/volumes",
        query: {"q": "programming", "sorting": "newest"},
      );
      BookModel books = BookModel.fromJson(result.data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("SomeThing went wrong ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchFeatureBooks() async {
    try {
      var result = await apiManager.getData(
        "/volumes",
        query: {"q": "programming", "Filtering": "free-ebooks"},
      );

      BookModel books = BookModel.fromJson(result.data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("SomeThing Went Wrong ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var result = await apiManager.getData(
        "/volumes",
        query: {
          "sorting": "relevance",
          "q": category,
          "Filtering": "Free-ebooks",
        },
      );
      BookModel books = BookModel.fromJson(result.data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("SomeThing Went Wrong ${e.toString()}"));
    }
  }
}
