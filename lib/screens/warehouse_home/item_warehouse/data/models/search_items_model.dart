class SearchItemsModel {
  SearchItemsModel({
    required this.currentPage,
    required this.dataSearch,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<DataSearch>? dataSearch;
  late final String firstPageUrl;
  late final int? from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Links> links;
  late final String? nextPageUrl;
  late final String path;
  late final int perPage;
  late final String? prevPageUrl;
  late final int? to;
  late final int total;

  SearchItemsModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    dataSearch = List.from(json['data']).map((e)=>DataSearch.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = dataSearch!.map((e)=>e.toJson()).toList();
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['links'] = links.map((e)=>e.toJson()).toList();
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class DataSearch {
  DataSearch({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.minimumQuantity,
    required this.status,
    this.available,
    required this.expiredDate,
    required this.typeId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String description;
  late final int quantity;
  late final int? minimumQuantity;
  late final int status;
  late final int? available;
  late final String? expiredDate;
  late final int typeId;
  late final int categoryId;
  late final String createdAt;
  late final String updatedAt;

  DataSearch.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    minimumQuantity = json['minimum_quantity'];
    status = json['status'];
    available = null;
    expiredDate = json['expired_date'];
    typeId = json['type_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['minimum_quantity'] = minimumQuantity;
    data['status'] = status;
    data['available'] = available;
    data['expired_date'] = expiredDate;
    data['type_id'] = typeId;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  Links({
    this.url,
    required this.label,
    required this.active,
  });
  late final String? url;
  late final String label;
  late final bool active;

  Links.fromJson(Map<String, dynamic> json){
    url = null;
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}