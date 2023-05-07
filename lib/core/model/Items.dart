/// title : "Noom"
/// subtitle : "Gabo Vase"
/// asset : "chair"

class ProductModel {
  ProductModel({
    String? id,
    String? title,
      String? subtitle,
    String? description,
    String? image,
    String? price,

  }){
    _id = id;
    _title = title;
    _subtitle = subtitle;
    _description = description;
    _image = image;
    _price = price;
}

  ProductModel.fromJson(dynamic json) {
    _id = json["id"];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _description = json["description"];
    _image = json['image'];
    _price= json['price'];

  }
  String? _id;
  String? _title;
  String? _subtitle;
  String? _description;
  String? _image;
  String? _price;
  ProductModel copyWith({  String? id,
  String? title,
  String? subtitle,
  String? description,
  String? image,
  String? price,
}) => ProductModel(  id: id ?? _id,
  title: title ?? _title,
  subtitle: subtitle ?? _subtitle,
  description: _description,
  image: image ?? _image,
  price: price ?? _price,

);
  String? get itemId => _id;
  String? get title => _title;
  String? get subtitle => _subtitle;
  String? get description => _description;
  String? get asset => _image;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _id;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map["description"]  =_description;
    map['image'] = _image;
    map['price'] = _price;
    return map;
  }

}