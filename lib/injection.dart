import 'dart:io';

import 'package:CreativeFabrica/core/network/dio.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/data/data_sources/sign_in_datasource.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/domain/use_cases/sign_in_usecase.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/presentation/manager/sign_in_bloc.dart';
import 'package:CreativeFabrica/features/home/data/data_sources/photos_datasource.dart';
import 'package:CreativeFabrica/features/home/domain/repositories/photos_repository.dart';
import 'package:CreativeFabrica/features/home/domain/use_cases/photos_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/anonymous_sign_in/data/repositories/sign_in_repository_impl.dart';
import 'features/anonymous_sign_in/domain/repositories/sign_in_repository.dart';
import 'features/home/data/repositories/photos_repository_impl.dart';
import 'features/home/presentation/manager/photos_bloc.dart';

final serviceLocator = GetIt.instance;

Future init() async {
  ///feature sign-in
  ///bloc
  serviceLocator.registerFactory(
    () => SignInBloc(useCase: serviceLocator()),
  );

  ///usecase
  serviceLocator.registerLazySingleton(() => SignInUseCase(serviceLocator()));

  ///repository
  serviceLocator.registerLazySingleton<SignInRepository>(() =>
      SignInRepositoryImpl(
          networkInfo: serviceLocator(), signInDataSource: serviceLocator()));

  ///data source
  serviceLocator
      .registerLazySingleton<SignInDataSource>(() => SignInDataSourceImpl());

  ///feature photos
  ///bloc
  serviceLocator.registerFactory(
    () => PhotosBloc(useCase: serviceLocator()),
  );

  ///usecase
  serviceLocator.registerLazySingleton(() => PhotosUseCase(serviceLocator()));

  ///repository
  serviceLocator.registerLazySingleton<PhotosRepository>(() =>
      PhotosRepositoryImpl(
          networkInfo: serviceLocator(), dataSource: serviceLocator()));

  ///data source
  serviceLocator.registerLazySingleton<PhotosDataSource>(
      () => PhotosDataSourceImpl(dioHandler: serviceLocator()));

  ///third parties and cores
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));
  final InternetConnectionChecker checker =
      InternetConnectionChecker.createInstance(addresses: [
    AddressCheckOptions(
      address: InternetAddress(
        '8.8.8.8',
        type: InternetAddressType.any,
      ),
    )
  ]);
  serviceLocator.registerLazySingleton(() => checker);
  final DioHandler dioHandler = DioHandler();
  serviceLocator.registerLazySingleton(() => dioHandler);
}
