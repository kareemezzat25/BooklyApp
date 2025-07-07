import 'package:bookly_app/core/resources/app_theme.dart';
import 'package:bookly_app/di.dart';
import 'package:bookly_app/features/home/presentation/cubits/feature_books/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/cubits/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

void main() {
  configureDependencies();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NewestBookCubit>()..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => getIt<FeatureBooksCubit>()..fetchFeatureBooks(),
        ),
      ],
      child: GetMaterialApp(
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
