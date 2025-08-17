class MarkerModel {
  final int id;
  final String type;
  final double lat;
  final double lng;

  MarkerModel({
    required this.id,
    required this.type,
    required this.lng,
    required this.lat,
  });

  factory MarkerModel.fromJson(Map<String, dynamic> json) {
    return MarkerModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "type": type, "lat": lat, "lng": lng};
  }
}
