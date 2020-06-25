class EchoARTarget {
  String id;
  String type;
  List<dynamic> holograms;
  String storageID;
  String filename;
  String country;
  String city;
  String place;
  String latitude;
  String longitude;

  EchoARTarget({
    this.id,
    this.type,
    this.holograms,
    this.filename,
    this.storageID,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.place,
  });

  factory EchoARTarget.fromJson(Map<String, dynamic> json) {
    return EchoARTarget(
      id: json['id'],
      type: json['type'],
      holograms: json['holograms'],
      storageID: json['storageID'],
      filename: json['filename'],
      country: json['country'],
      city: json['city'],
      place: json['place'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
