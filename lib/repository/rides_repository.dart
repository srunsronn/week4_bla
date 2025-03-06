import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride/rides_filter.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

/// An abstract class that defines the contract for a rides repository.
// Return A list of rides that match the given preference and filter.
abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}