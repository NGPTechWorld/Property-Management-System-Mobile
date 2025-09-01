class PostDto {
  final int id;
  final String title;
  final String description;
  final String type;
  final String location;
  final int budget;
  final String createdAt;
  final String status;

  PostDto({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.location,
    required this.budget,
    required this.createdAt,
    required this.status,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) => PostDto(
    id:
        json['id'] is int
            ? json['id']
            : int.tryParse(json['id'].toString()) ?? 0,
    title: json['title']?.toString() ?? '',
    description: json['description']?.toString() ?? '',
    type: json['type']?.toString() ?? '',
    location: json['location']?.toString() ?? '',
    budget:
        json['budget'] is num
            ? (json['budget'] as num).toInt()
            : int.tryParse(json['budget'].toString()) ?? 0,
    createdAt: json['createdAt']?.toString() ?? '',
    status: json['status']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'type': type,
    'location': location,
    'budget': budget,
    'createdAt': createdAt,
    'status': status,
  };

  factory PostDto.empty() => PostDto(
    id: 0,
    title: 'عنوان المنشور',
    description: 'وصف المنشور',
    type: '',
    location: 'الموقع',
    budget: 0,
    createdAt: '',
    status: 'قيد الانتظار',
  );

  static List<PostDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => PostDto.fromJson(e)).toList();
  }
}
