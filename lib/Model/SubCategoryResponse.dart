class SubCategoryResponse {
  int? total;
  int? count;
  int? offset;
  int? limit;
  List<SubItems>? items;

  SubCategoryResponse(
      {this.total, this.count, this.offset, this.limit, this.items});

  SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['items'] != null) {
      items = <SubItems>[];
      json['items'].forEach((v) {
        items!.add(new SubItems.fromJson(v));
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

class SubItems {
  int? id;
  String? sku;
  String? thumbnailUrl;
  bool? unlimited;
  bool? inStock;
  String? name;
  double? price;
  double? priceInProductList;
  int? defaultDisplayedPrice;
  String? defaultDisplayedPriceFormatted;
  int? costPrice;
  Tax? tax;
  bool? isShippingRequired;
  int? weight;
  String? url;
  String? created;
  String? updated;
  int? createTimestamp;
  int? updateTimestamp;
  int? productClassId;
  bool? enabled;
  List<Null>? options;
  int? warningLimit;
  bool? fixedShippingRateOnly;
  int? fixedShippingRate;
  Shipping? shipping;
  int? defaultCombinationId;
  String? imageUrl;
  String? smallThumbnailUrl;
  String? hdThumbnailUrl;
  String? originalImageUrl;
  OriginalImage? originalImage;
  BorderInfo? borderInfo;
  String? description;
  List<Null>? galleryImages;
  Media? media;
  List<int>? categoryIds;
  List<Categories>? categories;
  int? defaultCategoryId;
  String? seoTitle;
  String? seoDescription;
  Favorites? favorites;
  List<Null>? attributes;
  List<Files>? files;
  RelatedProducts? relatedProducts;
  List<Null>? combinations;
  ShippingPreparationTime? shippingPreparationTime;
  bool? showDeliveryTimeInStorefront;
  int? volume;
  int? showOnFrontpage;
  bool? isSampleProduct;
  String? googleItemCondition;
  bool? isGiftCard;
  bool? discountsAllowed;
  bool? nameYourPriceEnabled;
  String? productCondition;
  String? outOfStockVisibilityBehaviour;

  SubItems(
      {this.id,
      this.sku,
      this.thumbnailUrl,
      this.unlimited,
      this.inStock,
      this.name,
      this.price,
      this.priceInProductList,
      this.defaultDisplayedPrice,
      this.defaultDisplayedPriceFormatted,
      this.costPrice,
      this.tax,
      this.isShippingRequired,
      this.weight,
      this.url,
      this.created,
      this.updated,
      this.createTimestamp,
      this.updateTimestamp,
      this.productClassId,
      this.enabled,
      this.options,
      this.warningLimit,
      this.fixedShippingRateOnly,
      this.fixedShippingRate,
      this.shipping,
      this.defaultCombinationId,
      this.imageUrl,
      this.smallThumbnailUrl,
      this.hdThumbnailUrl,
      this.originalImageUrl,
      this.originalImage,
      this.borderInfo,
      this.description,
      this.galleryImages,
      this.media,
      this.categoryIds,
      this.categories,
      this.defaultCategoryId,
      this.seoTitle,
      this.seoDescription,
      this.favorites,
      this.attributes,
      this.files,
      this.relatedProducts,
      this.combinations,
      this.shippingPreparationTime,
      this.showDeliveryTimeInStorefront,
      this.volume,
      this.showOnFrontpage,
      this.isSampleProduct,
      this.googleItemCondition,
      this.isGiftCard,
      this.discountsAllowed,
      this.nameYourPriceEnabled,
      this.productCondition,
      this.outOfStockVisibilityBehaviour});

  SubItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    thumbnailUrl = json['thumbnailUrl'];
    unlimited = json['unlimited'];
    inStock = json['inStock'];
    name = json['name'];
    price = json['price'].toDouble();
    priceInProductList = json['priceInProductList'].toDouble();
    defaultDisplayedPrice = json['defaultDisplayedPrice'];
    defaultDisplayedPriceFormatted = json['defaultDisplayedPriceFormatted'];
    costPrice = json['costPrice'];
    tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
    isShippingRequired = json['isShippingRequired'];
    weight = json['weight'];
    url = json['url'];
    created = json['created'];
    updated = json['updated'];
    createTimestamp = json['createTimestamp'];
    updateTimestamp = json['updateTimestamp'];
    productClassId = json['productClassId'];
    enabled = json['enabled'];
    if (json['options'] != null) {
      options = <Null>[];
      // json['options'].forEach((v) { options!.add(new Null.fromJson(v)); });
    }
    warningLimit = json['warningLimit'];
    fixedShippingRateOnly = json['fixedShippingRateOnly'];
    fixedShippingRate = json['fixedShippingRate'];
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    defaultCombinationId = json['defaultCombinationId'];
    imageUrl = json['imageUrl'];
    smallThumbnailUrl = json['smallThumbnailUrl'];
    hdThumbnailUrl = json['hdThumbnailUrl'];
    originalImageUrl = json['originalImageUrl'];
    originalImage = json['originalImage'] != null
        ? new OriginalImage.fromJson(json['originalImage'])
        : null;
    borderInfo = json['borderInfo'] != null
        ? new BorderInfo.fromJson(json['borderInfo'])
        : null;
    description = json['description'];
    if (json['galleryImages'] != null) {
      galleryImages = <Null>[];
      // json['galleryImages'].forEach((v) { galleryImages!.add(new Null.fromJson(v)); });
    }
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    categoryIds = json['categoryIds'].cast<int>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    defaultCategoryId = json['defaultCategoryId'];
    seoTitle = json['seoTitle'];
    seoDescription = json['seoDescription'];
    favorites = json['favorites'] != null
        ? new Favorites.fromJson(json['favorites'])
        : null;
    if (json['attributes'] != null) {
      attributes = <Null>[];
      // json['attributes'].forEach((v) { attributes!.add(new Null.fromJson(v)); });
    }
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    relatedProducts = json['relatedProducts'] != null
        ? new RelatedProducts.fromJson(json['relatedProducts'])
        : null;
    if (json['combinations'] != null) {
      combinations = <Null>[];
      // json['combinations'].forEach((v) { combinations!.add(new Null.fromJson(v)); });
    }
    shippingPreparationTime = json['shippingPreparationTime'] != null
        ? new ShippingPreparationTime.fromJson(json['shippingPreparationTime'])
        : null;
    showDeliveryTimeInStorefront = json['showDeliveryTimeInStorefront'];
    volume = json['volume'];
    showOnFrontpage = json['showOnFrontpage'];
    isSampleProduct = json['isSampleProduct'];
    googleItemCondition = json['googleItemCondition'];
    isGiftCard = json['isGiftCard'];
    discountsAllowed = json['discountsAllowed'];
    nameYourPriceEnabled = json['nameYourPriceEnabled'];
    productCondition = json['productCondition'];
    outOfStockVisibilityBehaviour = json['outOfStockVisibilityBehaviour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['unlimited'] = this.unlimited;
    data['inStock'] = this.inStock;
    data['name'] = this.name;
    data['price'] = this.price;
    data['priceInProductList'] = this.priceInProductList;
    data['defaultDisplayedPrice'] = this.defaultDisplayedPrice;
    data['defaultDisplayedPriceFormatted'] =
        this.defaultDisplayedPriceFormatted;
    data['costPrice'] = this.costPrice;
    if (this.tax != null) {
      data['tax'] = this.tax!.toJson();
    }
    data['isShippingRequired'] = this.isShippingRequired;
    data['weight'] = this.weight;
    data['url'] = this.url;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['createTimestamp'] = this.createTimestamp;
    data['updateTimestamp'] = this.updateTimestamp;
    data['productClassId'] = this.productClassId;
    data['enabled'] = this.enabled;
    if (this.options != null) {
      // data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['warningLimit'] = this.warningLimit;
    data['fixedShippingRateOnly'] = this.fixedShippingRateOnly;
    data['fixedShippingRate'] = this.fixedShippingRate;
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    data['defaultCombinationId'] = this.defaultCombinationId;
    data['imageUrl'] = this.imageUrl;
    data['smallThumbnailUrl'] = this.smallThumbnailUrl;
    data['hdThumbnailUrl'] = this.hdThumbnailUrl;
    data['originalImageUrl'] = this.originalImageUrl;
    if (this.originalImage != null) {
      data['originalImage'] = this.originalImage!.toJson();
    }
    if (this.borderInfo != null) {
      data['borderInfo'] = this.borderInfo!.toJson();
    }
    data['description'] = this.description;
    if (this.galleryImages != null) {
      // data['galleryImages'] = this.galleryImages!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    data['categoryIds'] = this.categoryIds;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['defaultCategoryId'] = this.defaultCategoryId;
    data['seoTitle'] = this.seoTitle;
    data['seoDescription'] = this.seoDescription;
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.toJson();
    }
    if (this.attributes != null) {
      // data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.relatedProducts != null) {
      data['relatedProducts'] = this.relatedProducts!.toJson();
    }
    if (this.combinations != null) {
      // data['combinations'] = this.combinations!.map((v) => v.toJson()).toList();
    }
    if (this.shippingPreparationTime != null) {
      data['shippingPreparationTime'] = this.shippingPreparationTime!.toJson();
    }
    data['showDeliveryTimeInStorefront'] = this.showDeliveryTimeInStorefront;
    data['volume'] = this.volume;
    data['showOnFrontpage'] = this.showOnFrontpage;
    data['isSampleProduct'] = this.isSampleProduct;
    data['googleItemCondition'] = this.googleItemCondition;
    data['isGiftCard'] = this.isGiftCard;
    data['discountsAllowed'] = this.discountsAllowed;
    data['nameYourPriceEnabled'] = this.nameYourPriceEnabled;
    data['productCondition'] = this.productCondition;
    data['outOfStockVisibilityBehaviour'] = this.outOfStockVisibilityBehaviour;
    return data;
  }
}

class Tax {
  bool? taxable;
  int? defaultLocationIncludedTaxRate;
  List<int>? enabledManualTaxes;
  String? taxClassCode;

  Tax(
      {this.taxable,
      this.defaultLocationIncludedTaxRate,
      this.enabledManualTaxes,
      this.taxClassCode});

  Tax.fromJson(Map<String, dynamic> json) {
    taxable = json['taxable'];
    defaultLocationIncludedTaxRate = json['defaultLocationIncludedTaxRate'];
    enabledManualTaxes = json['enabledManualTaxes'].cast<int>();
    taxClassCode = json['taxClassCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxable'] = this.taxable;
    data['defaultLocationIncludedTaxRate'] =
        this.defaultLocationIncludedTaxRate;
    data['enabledManualTaxes'] = this.enabledManualTaxes;
    data['taxClassCode'] = this.taxClassCode;
    return data;
  }
}

class Shipping {
  String? type;
  int? methodMarkup;
  int? flatRate;
  List<Null>? disabledMethods;
  List<Null>? enabledMethods;

  Shipping(
      {this.type,
      this.methodMarkup,
      this.flatRate,
      this.disabledMethods,
      this.enabledMethods});

  Shipping.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    methodMarkup = json['methodMarkup'];
    flatRate = json['flatRate'];
    if (json['disabledMethods'] != null) {
      disabledMethods = <Null>[];
      // json['disabledMethods'].forEach((v) { disabledMethods!.add(new Null.fromJson(v)); });
    }
    if (json['enabledMethods'] != null) {
      enabledMethods = <Null>[];
      // json['enabledMethods'].forEach((v) { enabledMethods!.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['methodMarkup'] = this.methodMarkup;
    data['flatRate'] = this.flatRate;
    if (this.disabledMethods != null) {
      // data['disabledMethods'] = this.disabledMethods!.map((v) => v.toJson()).toList();
    }
    if (this.enabledMethods != null) {
      // data['enabledMethods'] = this.enabledMethods!.map((v) => v.toJson()).toList();
    }
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

class Media {
  List<Images>? images;

  Media({this.images});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? id;
  bool? isMain;
  int? orderBy;
  String? image160pxUrl;
  String? image400pxUrl;
  String? image800pxUrl;
  String? image1500pxUrl;
  String? imageOriginalUrl;

  Images(
      {this.id,
      this.isMain,
      this.orderBy,
      this.image160pxUrl,
      this.image400pxUrl,
      this.image800pxUrl,
      this.image1500pxUrl,
      this.imageOriginalUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMain = json['isMain'];
    orderBy = json['orderBy'];
    image160pxUrl = json['image160pxUrl'];
    image400pxUrl = json['image400pxUrl'];
    image800pxUrl = json['image800pxUrl'];
    image1500pxUrl = json['image1500pxUrl'];
    imageOriginalUrl = json['imageOriginalUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isMain'] = this.isMain;
    data['orderBy'] = this.orderBy;
    data['image160pxUrl'] = this.image160pxUrl;
    data['image400pxUrl'] = this.image400pxUrl;
    data['image800pxUrl'] = this.image800pxUrl;
    data['image1500pxUrl'] = this.image1500pxUrl;
    data['imageOriginalUrl'] = this.imageOriginalUrl;
    return data;
  }
}

class Categories {
  int? id;
  bool? enabled;

  Categories({this.id, this.enabled});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enabled'] = this.enabled;
    return data;
  }
}

class Favorites {
  int? count;
  String? displayedCount;

  Favorites({this.count, this.displayedCount});

  Favorites.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    displayedCount = json['displayedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['displayedCount'] = this.displayedCount;
    return data;
  }
}

class Files {
  int? id;
  String? name;
  String? description;
  int? size;
  String? adminUrl;

  Files({this.id, this.name, this.description, this.size, this.adminUrl});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    size = json['size'];
    adminUrl = json['adminUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['size'] = this.size;
    data['adminUrl'] = this.adminUrl;
    return data;
  }
}

class RelatedProducts {
  List<Null>? productIds;
  RelatedCategory? relatedCategory;

  RelatedProducts({this.productIds, this.relatedCategory});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    if (json['productIds'] != null) {
      productIds = <Null>[];
      // json['productIds'].forEach((v) { productIds!.add(new Null.fromJson(v)); });
    }
    relatedCategory = json['relatedCategory'] != null
        ? new RelatedCategory.fromJson(json['relatedCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productIds != null) {
      // data['productIds'] = this.productIds!.map((v) => v.toJson()).toList();
    }
    if (this.relatedCategory != null) {
      data['relatedCategory'] = this.relatedCategory!.toJson();
    }
    return data;
  }
}

class RelatedCategory {
  bool? enabled;
  int? categoryId;
  int? productCount;

  RelatedCategory({this.enabled, this.categoryId, this.productCount});

  RelatedCategory.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    categoryId = json['categoryId'];
    productCount = json['productCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['categoryId'] = this.categoryId;
    data['productCount'] = this.productCount;
    return data;
  }
}

class ShippingPreparationTime {
  // ShippingPreparationTime({});

  ShippingPreparationTime.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
