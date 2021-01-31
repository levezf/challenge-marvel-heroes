import 'package:challenge_marvel_heroes/data/datasource/local_file_data_source.dart';
import 'package:challenge_marvel_heroes/data/repositories/character_repository_impl.dart';
import 'package:challenge_marvel_heroes/domain/repositories/character_repository.dart';
import 'package:challenge_marvel_heroes/domain/usecases/get_characters_by_type.dart';
import 'package:challenge_marvel_heroes/ui/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void init() {

  //! Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(getCharactersByType: sl()));

  //! UseCases
  sl.registerLazySingleton(() => GetCharactersByType(repository: sl()));
  
  //! Repositories
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(
        localFileDataSource: sl(),
      ));

  //! DataSources
  sl.registerLazySingleton<LocalFileDataSource>(
      () => LocalFileDataSourceImpl());
}
