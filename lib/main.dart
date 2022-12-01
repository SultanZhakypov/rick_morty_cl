import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/feature/home/presentation/bloc/person_cubit/person_cubit.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_morty/feature/home/presentation/providers/rick_morty_provider.dart';
import 'package:rick_morty/routes/app_routes.gr.dart';
import 'package:rick_morty/service_locator.dart' as di;
import 'package:rick_morty/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Init(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Rick Morty',
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}

class Init extends StatelessWidget {
  const Init({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<RickMortyProvider>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadingPerson(),
          ),
          BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
