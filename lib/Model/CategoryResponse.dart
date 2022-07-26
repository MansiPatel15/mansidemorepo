class CategoryResponse {
  int? total;
  int? count;
  int? offset;
  int? limit;
  List<Items>? items;

  CategoryResponse(
      {this.total, this.count, this.offset, this.limit, this.items});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? parentId;
  int? orderBy;
  String? hdThumbnailUrl;
  String? thumbnailUrl;
  String? originalImageUrl;
  String? imageUrl;
  OriginalImage? originalImage;
  OriginalImage? thumbnail;
  BorderInfo? borderInfo;
  String? name;
  String? url;
  int? productCount;
  String? description;
  bool? enabled;
  bool? isSampleCategory;

  Items(
      {this.id,
      this.parentId,
      this.orderBy,
      this.hdThumbnailUrl,
      this.thumbnailUrl,
      this.originalImageUrl,
      this.imageUrl,
      this.originalImage,
      this.thumbnail,
      this.borderInfo,
      this.name,
      this.url,
      this.productCount,
      this.description,
      this.enabled,
      this.isSampleCategory});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    orderBy = json['orderBy'];
    hdThumbnailUrl = json['hdThumbnailUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    originalImageUrl = json['originalImageUrl'];
    imageUrl = json['imageUrl'];
    originalImage = json['originalImage'] != null
        ? new OriginalImage.fromJson(json['originalImage'])
        : null;
    thumbnail = json['thumbnail'] != null
        ? new OriginalImage.fromJson(json['thumbnail'])
        : null;
    borderInfo = json['borderInfo'] != null
        ? new BorderInfo.fromJson(json['borderInfo'])
        : null;
    name = json['name'];
    url = json['url'];
    productCount = json['productCount'];
    description = json['description'];
    enabled = json['enabled'];
    isSampleCategory = json['isSampleCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['orderBy'] = this.orderBy;
    data['hdThumbnailUrl'] = this.hdThumbnailUrl;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['originalImageUrl'] = this.originalImageUrl;
    data['imageUrl'] = this.imageUrl;
    if (this.originalImage != null) {
      data['originalImage'] = this.originalImage!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.borderInfo != null) {
      data['borderInfo'] = this.borderInfo!.toJson();
    }
    data['name'] = this.name;
    data['url'] = this.url;
    data['productCount'] = this.productCount;
    data['description'] = this.description;
    data['enabled'] = this.enabled;
    data['isSampleCategory'] = this.isSampleCategory;
    return data;
  }
}

class OriginalImage {
  String? url;
  int? width;
  int? height;

  OriginalImage({this.url, this.width, this.height});

  OriginalImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class BorderInfo {
  DominatingColor? dominatingColor;
  bool? homogeneity;

  BorderInfo({this.dominatingColor, this.homogeneity});

  BorderInfo.fromJson(Map<String, dynamic> json) {
    dominatingColor = json['dominatingColor'] != null
        ? new DominatingColor.fromJson(json['dominatingColor'])
        : null;
    homogeneity = json['homogeneity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dominatingColor != null) {
      data['dominatingColor'] = this.dominatingColor!.toJson();
    }
    data['homogeneity'] = this.homogeneity;
    return data;
  }
}

class DominatingColor {
  int? red;
  int? green;
  int? blue;
  int? alpha;

  DominatingColor({this.red, this.green, this.blue, this.alpha});

  DominatingColor.fromJson(Map<String, dynamic> json) {
    red = json['red'];
    green = json['green'];
    blue = json['blue'];
    alpha = json['alpha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['red'] = this.red;
    data['green'] = this.green;
    data['blue'] = this.blue;
    data['alpha'] = this.alpha;
    return data;
  }
}
