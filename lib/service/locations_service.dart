import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/locations_repository.dart';

class LocationsService {
  static LocationsService? _instance;
  final LocationsRepository repository;

  LocationsService._internal(this.repository);

  static void initialize(LocationsRepository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("LocationsService is already initialized");
    }
  }

  static LocationsService get instance {
    if (_instance == null) {
      throw Exception("LocationsService is not initialized");
    }
    return _instance!;
  }

  List<Location> get avaibleLocations => repository.getLocations();

  List<Location> getLocationsFor(String text) {
    return repository
        .getLocations()
        .where((location) =>
            location.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}

//repository
