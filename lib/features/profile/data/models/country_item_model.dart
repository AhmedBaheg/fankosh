/// Country data model representing an selectable country item.
class CountryItem {
  const CountryItem({
    required this.name,
    required this.flag,
  });

  final String name;
  final String flag;

  String get displayName => '$name $flag';
}
