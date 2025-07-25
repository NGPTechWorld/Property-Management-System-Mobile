class PaginatedModel<T> {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final List<T> data;

  PaginatedModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.data,
  });

  factory PaginatedModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final List<T> parsedData =
        (json["data"] as List<dynamic>? ?? [])
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList();

    final pagination = json["pagination"] ?? {};

    int parseInt(dynamic value, [int defaultValue = 1]) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    return PaginatedModel<T>(
      currentPage: parseInt(pagination["currentPage"], 1),
      totalPages: parseInt(pagination["totalPages"], 1),
      totalItems: parseInt(pagination["totalItems"], parsedData.length),
      itemsPerPage: parseInt(pagination["itemsPerPage"], parsedData.length),
      data: parsedData,
    );
  }
}
