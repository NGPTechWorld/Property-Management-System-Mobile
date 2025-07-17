enum PropertyDirection {
  north('شمال'),
  south('جنوب'),
  east('شرق'),
  west('غرب'),
  northEast('شمال شرق'),
  northWest('شمال غرب'),
  southEast('جنوب شرق'),
  southWest('جنوب غرب');

  final String value;
  const PropertyDirection(this.value);

  factory PropertyDirection.fromValue(String value) {
    return PropertyDirection.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyDirection.north,
    );
  }
}
