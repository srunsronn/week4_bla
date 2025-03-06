import 'package:week_3_blabla_project/model/ride/rides_filter.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  //private instance of the service
  static RidesService? _instance;

  // repository
  final RidesRepository repository;

  //private constructor
  RidesService._internal(this.repository);

  //initialize the service
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("RidesService is already initialized");
    }
  }

  //get the instance of the service
  static RidesService get instance {
    if (_instance == null) {
      throw Exception("RidesService is not initialized");
    }
    return _instance!;
  }

  List<Ride> getRidesFor(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }
 
}