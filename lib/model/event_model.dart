class Event {
  int id;
  String eventName;
  String eventDescription;
  String startTime;
  String endTime;
  String thumbnail;
  String eventURL;
  Address address;

  Event(
      {required this.id,
      required this.eventName,
      required this.eventDescription,
      required this.startTime,
      required this.endTime,
      required this.thumbnail,
      required this.eventURL,
      required this.address});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        eventName: json['event_name'],
        eventDescription: json['event_description'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        thumbnail: json['thumbnail'],
        eventURL: json['eventURL'],
        address: Address.fromJson(json['address']));
  }
}

class Address {
  int id;
  String zipcode;
  String street;
  String number;
  String complement;
  String neighborhood;
  String city;
  String uf;
  Location location;

  Address(
      {required this.id,
      required this.zipcode,
      required this.street,
      required this.number,
      required this.complement,
      required this.neighborhood,
      required this.city,
      required this.uf,
      required this.location});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        zipcode: json['zipcode'],
        street: json['street'],
        number: json['number'],
        complement: json['complement'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        uf: json['uf'],
        location: Location.fromJson(json['location']));
  }
}

class Location {
  String lat;
  String long;

  Location({
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      long: json['long'],
    );
  }
}
