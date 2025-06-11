import '../../../databases/api/end_points.dart';
import '../../domain/entities/message_entety.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.message});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json[ApiKey.message],
    );
  }
}
