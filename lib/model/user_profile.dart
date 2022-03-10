import 'dart:ffi';

class UserProfile{
  final int UserID;
  final String FName;
  final String LName;
  final String email;
  final DateTime joinTimestamp;
  final String Details;
  final DateTime BirthDate;
  final int age;
  final int GenderID;
  final int foodGenderID;
  final Location location;
  final String imageURLs;
  final int radius;
  final List favFood;
  final double popularity;
}


class Location {
  final Float latitude;
  final Float longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  })
}