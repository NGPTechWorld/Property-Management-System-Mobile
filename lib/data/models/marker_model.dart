class MarkerModel {
  final int id;
  final String type;
  final double lat;
  final double lng;
  final Map<String, dynamic>? card;

  MarkerModel({
    required this.id,
    required this.type,
    required this.lng,
    required this.lat,
    this.card,
  });

  factory MarkerModel.fromJson(Map<String, dynamic> json) {
    return MarkerModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
      card: json['card'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "type": type, "lat": lat, "lng": lng, "card": card};
  }
}
