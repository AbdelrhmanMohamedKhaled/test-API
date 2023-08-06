class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordenate coordinates;
  final LocationTimezoneCoordenate timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.street,
    required this.coordinates,
    required this.timezone,
    required this.postcode,
  });
}

class LocationCoordenate {
  final String latitude;
  final String longitude;

  LocationCoordenate({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTimezoneCoordenate {
  final String offset;
  final String description;
  LocationTimezoneCoordenate({
    required this.description,
    required this.offset,
  });
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.name,
    required this.number,
  });
}
