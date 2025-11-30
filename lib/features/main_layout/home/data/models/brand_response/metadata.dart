class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }
}
