class PaginationParams {
  final int limit;
  final int offset;

  const PaginationParams({
    this.limit = 10,
    this.offset = 0,
  });

  PaginationParams nextPage() => PaginationParams(
    limit: limit,
    offset: offset + limit,
  );
}
