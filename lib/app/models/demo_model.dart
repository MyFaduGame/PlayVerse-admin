// @todos when model create remove this model
class BrandModel {
  final String? name;
  final String? brandId;
  final Image? image;

  BrandModel({
    this.name,
    this.brandId,
    this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        name: json["name"],
        brandId: json["brand_id"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );
}

class Image {
  final String? image;
  final String? image256;
  final String? image512;
  final String? image1024;

  Image({
    this.image,
    this.image256,
    this.image512,
    this.image1024,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json["image"],
        image256: json["image_256"],
        image512: json["image_512"],
        image1024: json["image_1024"],
      );
}
