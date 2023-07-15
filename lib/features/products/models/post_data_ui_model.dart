// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DataModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;

  DataModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  DataModel copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    Category? category,
  }) {
    return DataModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'category': category?.toMap(),
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null ? List<String>.from((map['images'])) : null,
      category: map['category'] != null
          ? Category.fromMap(map['category'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataModel(id: $id, title: $title, price: $price, description: $description, images: $images, category: $category)';
  }

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        images.hashCode ^
        category.hashCode;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  Category copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
