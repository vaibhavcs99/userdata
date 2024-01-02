import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:userdata/core/services/api_service.dart';
import 'package:userdata/data/data_sources/remote_data_sources/user/user_remote_data_source.dart';
import 'package:userdata/data/data_sources/remote_data_sources/user/user_remote_data_source_impl.dart';
import 'package:userdata/data/repositories/user_repository_impl.dart';
import 'package:userdata/domain/repositories/user_repository.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

final GetIt locator = GetIt.instance;

void registerDependencies() {
  // API Services
  locator.registerLazySingleton<Dio>(() => Dio(), instanceName: 'Dio');

  locator.registerLazySingleton<ApiService>(
      () => ApiService(dio: locator(instanceName: 'Dio')),
      instanceName: 'ApiService');

  // Data Sources
  locator.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(apiService: locator(instanceName: 'ApiService')),
      instanceName: 'UserDataSource');

  //Repository
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
          userDataSource: locator(instanceName: 'UserDataSource')),
      instanceName: 'UserRepository');

  //Usecases
  locator.registerLazySingleton<FetchUserListUseCase>(
      () => FetchUserListUseCase(
          userRepository: locator(instanceName: 'UserRepository')),
      instanceName: 'FetchUserListUseCase');

  locator.registerLazySingleton<FetchUserDetailsUseCase>(
      () => FetchUserDetailsUseCase(
          userRepository: locator(instanceName: 'UserRepository')),
      instanceName: 'FetchUserDetailsUseCase');
}
