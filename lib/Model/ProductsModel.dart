class ProductsModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.products, this.total, this.skip, this.limit});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    products = (json['products'] as List?)?.map((e) => Products.fromJson(e)).toList() ?? [];
    total = json['total'] ?? 0;
    skip = json['skip'] ?? 0;
    limit = json['limit'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}


class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    category = json['category'] ?? '';
    price = _parseToDouble(json['price']);
    discountPercentage = _parseToDouble(json['discountPercentage']);
    rating = _parseToDouble(json['rating']);
    stock = json['stock'] ?? 0;
    tags = (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];
    brand = json['brand'] ?? '';
    sku = json['sku'] ?? '';
    weight = json['weight'] ?? 0;
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'] ?? '';
    shippingInformation = json['shippingInformation'] ?? '';
    availabilityStatus = json['availabilityStatus'] ?? '';
    reviews = (json['reviews'] as List?)
        ?.map((e) => Reviews.fromJson(e))
        .toList() ??
        [];
    returnPolicy = json['returnPolicy'] ?? '';
    minimumOrderQuantity = json['minimumOrderQuantity'] ?? 0;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [];
    thumbnail = json['thumbnail'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  static double _parseToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }
}


class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = Products._parseToDouble(json['width']);
    height = Products._parseToDouble(json['height']);
    depth = Products._parseToDouble(json['depth']);
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}


class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] ?? 0;
    comment = json['comment'] ?? '';
    date = json['date'] ?? '';
    reviewerName = json['reviewerName'] ?? '';
    reviewerEmail = json['reviewerEmail'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}


class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    barcode = json['barcode'] ?? '';
    qrCode = json['qrCode'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}

