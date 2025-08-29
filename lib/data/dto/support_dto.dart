import 'dart:convert';

class SupportDto {
  final String question;
  final String answer;

  SupportDto({required this.question, required this.answer});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'question': question, 'answer': answer};
  }

  factory SupportDto.fromMap(Map<String, dynamic> map) {
    return SupportDto(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupportDto.fromJson(String source) =>
      SupportDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
