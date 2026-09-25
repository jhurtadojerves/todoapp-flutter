class Paginated<T> {
  const Paginated({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;
  factory Paginated.fromJson(
    dynamic data,
    T Function(Map<String, dynamic>) decode,
  ) {
    final json = data as Map<String, dynamic>;
    if (!json.containsKey('next') || !json.containsKey('previous')) {
      throw const FormatException('Missing pagination keys');
    }
    return Paginated(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => decode(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
