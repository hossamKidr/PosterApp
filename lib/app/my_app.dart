import 'package:flutter/material.dart';
import 'package:go_plus/core/app_theme.dart';
import 'package:go_plus/features/posters/presintation/view_models/poster_view_model/poster_bloc/poster_bloc.dart';
import '../core/rouets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_plus/injector.dart'as di;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>di.gitIt<PosterBloc>()),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: Routes.splash,
    ));

  }
}
