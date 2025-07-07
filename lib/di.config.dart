// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/home/data/home_repo.dart' as _i739;
import 'features/home/data/home_repo_impl.dart' as _i91;
import 'features/home/presentation/cubits/feature_books/feature_books_cubit.dart'
    as _i834;
import 'features/home/presentation/cubits/newest_books/newest_books_cubit.dart'
    as _i736;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i739.HomeRepo>(
      () => _i91.HomeRepoImpl(apiManager: gh<_i237.ApiManager>()),
    );
    gh.factory<_i834.FeatureBooksCubit>(
      () => _i834.FeatureBooksCubit(homeRepo: gh<_i739.HomeRepo>()),
    );
    gh.factory<_i736.NewestBookCubit>(
      () => _i736.NewestBookCubit(homeRepo: gh<_i739.HomeRepo>()),
    );
    return this;
  }
}
