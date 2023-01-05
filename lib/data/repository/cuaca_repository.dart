import 'package:flutter_rekadigi/data/service/api/cuaca_api.dart';
import 'package:flutter_rekadigi/model/lokasi.dart';
import 'package:flutter_rekadigi/model/wheater.dart';

class LocationRepository {
  final LocationApi _LocationApi;

  LocationRepository(this._LocationApi);

  Future<List<LokasiModel>> location() async {
    try {
      final res = await _LocationApi.getLocation();
      final loc = ((res.data ?? []) as List)
          .map((e) => LokasiModel.fromJson(e))
          .toList();
      return loc;
    } catch (e) {
      print('Error Medical Facilitys - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<WheaterModel>> wheater({required String idLoc}) async {
    try {
      final res = await _LocationApi.getWheater(idLoc: idLoc);
      final whe = ((res.data ?? []) as List)
          .map((e) => WheaterModel.fromJson(e))
          .toList();
      return whe;
    } catch (e) {
      print('Error Medical Facilitys - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<WheaterModel>> imageWheater({required String idLoc}) async {
    try {
      final res = await _LocationApi.getWheater(idLoc: idLoc);
      final whe = ((res.data ?? []) as List)
          .map((e) => WheaterModel.fromJson(e))
          .toList();
      return whe;
    } catch (e) {
      print('Error Medical Facilitys - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }
}
