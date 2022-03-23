class GetNewsRequest {
  int page;
  int pageSize;

  GetNewsRequest({
    required this.page,
    this.pageSize = 10,
  });
}
