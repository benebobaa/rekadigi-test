import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rekadigi/data/service/const_api.dart';
import 'package:flutter_rekadigi/data/service/dio_client.dart';

class LocationApi {
  final DioClient _dioClient;

  LocationApi(this._dioClient);

  Future<Response> getLocation() async {
    try {
      final Response res = await _dioClient.get(
        ConstantApi.cuacaWilayah,
      );
      return res;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<Response> getWheater({required String idLoc}) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.cuacaWilayaDetail}${idLoc}.json',
      );
      return res;
    } on DioError catch (e) {
      rethrow;
    }
  }


  Future<Response> getImage({required String idStatus}) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.imageStatus}${idStatus}.png',
      );
      return res;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
