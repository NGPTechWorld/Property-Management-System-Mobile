class PaginationEntity {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final bool? hasMorePage;

  PaginationEntity({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.hasMorePage,
  });
}
