import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rick_morty/feature/home/data/datasources/person_local_datasource.dart';
import 'package:rick_morty/feature/home/data/datasources/person_remote_datasource.dart';
import 'package:rick_morty/feature/home/data/repositories/person_repo_impl.dart';
import 'package:rick_morty/feature/home/domain/repositories/person_repo.dart';
import 'package:rick_morty/feature/home/domain/usecases/get_all_person.dart';
import 'package:rick_morty/feature/home/domain/usecases/search_person.dart';
import 'package:rick_morty/feature/home/presentation/bloc/person_cubit/person_cubit.dart';
import 'package:rick_morty/feature/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/feature/home/presentation/providers/rick_morty_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => PersonListCubit(getAllPersons: sl()));
  sl.registerFactory(() => PersonSearchBloc(searchPersons: sl()));
  sl.registerFactory(() => RickMortyProvider());
  sl.registerLazySingleton(() => GetAllPersons(personRepo: sl()));
  sl.registerLazySingleton(() => SearchPerson(personRepo: sl()));
  sl.registerLazySingleton<PersonRepo>(() => PersonRepoImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<PersonRemoteDataSource>(
      () => PersonRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<PersonLocalDataSource>(
      () => PersonLocalDataSourceImpl(prefs: sl()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);
}
