import 'package:dio/dio.dart';
import 'package:flutter_rekadigi/data/repository/cuaca_repository.dart';
import 'package:flutter_rekadigi/data/service/api/cuaca_api.dart';
import 'package:flutter_rekadigi/data/service/dio_client.dart';
import 'package:flutter_rekadigi/model/lokasi.dart';
import 'package:flutter_rekadigi/model/wheater.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// Networking
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // Home
  getIt.registerSingleton(LocationApi(getIt<DioClient>()));
  getIt.registerSingleton(LocationRepository(getIt<LocationApi>()));

  /// Global Variable
  getIt.registerSingleton(LokasiModel());
  getIt.registerSingleton(WheaterModel());
}
