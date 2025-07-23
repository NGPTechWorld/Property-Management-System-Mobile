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

    return PaginatedModel<T>(
      currentPage: pagination["currentPage"] ?? 1,
      totalPages: pagination["totalPages"] ?? 1,
      totalItems: pagination["totalItems"] ?? parsedData.length,
      itemsPerPage: pagination["itemsPerPage"] ?? parsedData.length,
      data: parsedData,
    );
  }
}
