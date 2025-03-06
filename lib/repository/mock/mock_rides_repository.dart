import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride/rides_filter.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';
import '../../model/user/user.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _allRides = [];

  MockRidesRepository() {
    // FAKE USERS
    User kanika = User(
        firstName: "Kannika",
        lastName: '',
        email: 'kannika@example.com',
        phone: '123456789',
        profilePicture: '',
        verifiedProfile: true);
    User chaylim = User(
        firstName: "Chaylim",
        lastName: '',
        email: 'chaylim@example.com',
        phone: '123456789',
        profilePicture: '',
        verifiedProfile: true);
    User mengtech = User(
        firstName: "Mengtech",
        lastName: '',
        email: 'mengtech@example.com',
        phone: '123456789',
        profilePicture: '',
        verifiedProfile: true);
    User limhao = User(
        firstName: "Limhao",
        lastName: '',
        email: 'limhao@example.com',
        phone: '123456789',
        profilePicture: '',
        verifiedProfile: true);
    User sovanda = User(
        firstName: "Sovanda",
        lastName: '',
        email: 'sovanda@example.com',
        phone: '123456789',
        profilePicture: '',
        verifiedProfile: true);

    // FAKE LOCATIONS
    Location battambang =
        Location(name: "Battambang", country: Country.cambodia);
    Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

    // FAKE RIDES
    _allRides.addAll([
      Ride(
          departureLocation: battambang,
          arrivalLocation: siemReap,
          departureDate: DateTime.now().copyWith(hour: 17, minute: 30),
          arrivalDateTime: DateTime.now().copyWith(hour: 19, minute: 30),
          driver: kanika,
          availableSeats: 2,
          pricePerSeat: 10.0),
      Ride(
          departureLocation: battambang,
          arrivalLocation: siemReap,
          departureDate: DateTime.now().copyWith(hour: 20, minute: 0),
          arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 0),
          driver: chaylim,
          availableSeats: 0,
          pricePerSeat: 10.0),
      Ride(
          departureLocation: battambang,
          arrivalLocation: siemReap,
          departureDate: DateTime.now().copyWith(hour: 17, minute: 0),
          arrivalDateTime: DateTime.now().copyWith(hour: 20, minute: 0),
          driver: mengtech,
          availableSeats: 1,
          pricePerSeat: 10.0),
      Ride(
          departureLocation: battambang,
          arrivalLocation: siemReap,
          departureDate: DateTime.now().copyWith(hour: 20, minute: 0),
          arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 0),
          driver: limhao,
          availableSeats: 2,
          pricePerSeat: 10.0,
          petAccepted: true),
      Ride(
          departureLocation: battambang,
          arrivalLocation: siemReap,
          departureDate: DateTime.now().copyWith(hour: 17, minute: 0),
          arrivalDateTime: DateTime.now().copyWith(hour: 20, minute: 0),
          driver: sovanda,
          availableSeats: 1,
          pricePerSeat: 10.0),
    ]);
  }

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _allRides
        .where((ride) =>
            // Filter on departure / arrival
            ride.departureLocation == preference.departure &&
            ride.arrivalLocation == preference.arrival &&

            // filter on pet
            (filter != null && filter.petAccepted ? ride.petAccepted : true) &&

            // Filter on ride with available seats only
            ride.availableSeats > 0)
        .toList();
  }
}
