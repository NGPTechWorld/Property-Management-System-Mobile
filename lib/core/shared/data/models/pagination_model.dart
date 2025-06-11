// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// import '../../../databases/api/end_points.dart';
// import '../../domain/entities/pagination_entity.dart';

// class PaginationModel extends PaginationEntity with EquatableMixin {
//   PaginationModel({
//     super.currentPage,
//     super.totalPages,
//     super.totalItems,
//     super.hasMorePage,
//   });

//   factory PaginationModel.fromMap(Map<String, dynamic> data) => PaginationModel(
//         currentPage: data[ApiKey.currentPage] as int?,
//         totalPages: data[ApiKey.totalPages] as int?,
//         totalItems: data[ApiKey.totalItems] as int?,
//         hasMorePage: data[ApiKey.hasMorePage] as bool?,
//       );

//   Map<String, dynamic> toMap() => {
//         ApiKey.currentPage: currentPage,
//         ApiKey.totalPages: totalPages,
//         ApiKey.totalItems: totalItems,
//         ApiKey.hasMorePage: hasMorePage,
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [PaginationModel].
//   factory PaginationModel.fromJson(String data) {
//     return PaginationModel.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [PaginationModel] to a JSON string.
//   String toJson() => json.encode(toMap());

//   PaginationModel copyWith({
//     int? currentPage,
//     int? totalPages,
//     int? totalItems,
//     bool? hasMorePage,
//   }) {
//     return PaginationModel(
//       currentPage: currentPage ?? this.currentPage,
//       totalPages: totalPages ?? this.totalPages,
//       totalItems: totalItems ?? this.totalItems,
//       hasMorePage: hasMorePage ?? this.hasMorePage,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       currentPage,
//       totalPages,
//       totalItems,
//       hasMorePage,
//     ];
//   }
// }
