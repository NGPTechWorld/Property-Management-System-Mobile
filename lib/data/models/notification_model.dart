class NotificationModel {
  final int id;
  final String name;
  final String title;
  final String body;
  final bool isRead;
  final String sentAt;
  final NotificationData data;

  NotificationModel({
    required this.id,
    required this.name,
    required this.title,
    required this.body,
    required this.isRead,
    required this.sentAt,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      name: json['name'] ?? '',
      body: json['body'] ?? '',
      isRead: json['isRead'] ?? false,
      sentAt: json['sent_at'] ?? '',
      data: NotificationData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "isRead": isRead,
      "sent_at": sentAt,
      "data": data.toJson(),
    };
  }
}

class NotificationData {
  final int adId;

  NotificationData({required this.adId});

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(adId: json['adId'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {"adId": adId};
  }
}
