extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
  
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}


// Extension to capitalize strings
extension StringCapitalize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

//! add more extensions here:
