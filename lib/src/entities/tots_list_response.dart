class TotsListResponse<T> {
  int currentPage = 0;
  String firstPageUrl = '';
  int from = 0;
  int lastPage = 0;
  String lastPageUrl = '';
  String nextPageUrl = '';
  String path = '';
  int perPage = 0;
  String prevPageUrl = '';
  int to = 0;
  int total = 0;
  List<T> data = List.empty(growable: true);

  TotsListResponse<T> fromJson(Map<String, dynamic> json, List<T> dataList) {
    currentPage = json['current_page'] is int ? json['current_page'] : int.parse(json['current_page']);
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'] is int ? json['last_page'] : int.parse(json['last_page']);
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'] is int ? json['per_page'] : int.parse(json['per_page']);
    prevPageUrl = json['prev_page_url'];
    to = json['to'] is int ? json['to'] : int.parse(json['to']);
    total = json['total'] is int ? json['total'] : int.parse(json['total']);

    data = dataList;

    return this;
  }
}