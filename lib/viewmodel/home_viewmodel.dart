import 'package:flutter/widgets.dart';
import 'package:flutter_rekadigi/data/repository/cuaca_repository.dart';
import 'package:flutter_rekadigi/di/service_locator.dart';
import 'package:flutter_rekadigi/model/lokasi.dart';
import 'package:flutter_rekadigi/model/wheater.dart';

class HomeViewModel with ChangeNotifier {
  String id = '501266';
  final _locationRepository = getIt.get<LocationRepository>();
  List<LokasiModel> _location = [];

  List<LokasiModel> get location => _location;

  // List<LokasiModel> _display = _location;

  // List<LokasiModel> get display => _display;

  List<WheaterModel> _wheater = [];

  List<WheaterModel> get wheater => _wheater;
  bool isLoading = false;

  // void searchId(String id) {
  //   _display = _location.where((element) => element.id!.contains(id)).toList();
  //   notifyListeners();
  // }

  Future<void> getLocation() async {
    isLoading = true;
    notifyListeners();

    final data = await _locationRepository.location();
    _location = data;

    print(_location);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getWheater() async {
    isLoading = true;
    notifyListeners();

    final data = await _locationRepository.wheater(idLoc: id);
    _wheater = data;

    print(_location);
    isLoading = false;
    notifyListeners();
  }
}
