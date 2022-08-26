import 'dart:convert';

import 'package:flutter/foundation.dart';

class Shoe {
  String imageUrl;
  String shoeName;
  double price;
  List colorsList;
  List sizeList;
  bool isFavourite;
  double discountP;
  Shoe({
    required this.imageUrl,
    required this.shoeName,
    required this.price,
    required this.colorsList,
    required this.sizeList,
    required this.isFavourite,
    required this.discountP,
  });

  Shoe copyWith({
    String? imageUrl,
    String? shoeName,
    double? price,
    List? colorsList,
    List? sizeList,
    bool? isFavourite,
    double? discountP,
  }) {
    return Shoe(
      imageUrl: imageUrl ?? this.imageUrl,
      shoeName: shoeName ?? this.shoeName,
      price: price ?? this.price,
      colorsList: colorsList ?? this.colorsList,
      sizeList: sizeList ?? this.sizeList,
      isFavourite: isFavourite ?? this.isFavourite,
      discountP: discountP ?? this.discountP,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'shoeName': shoeName,
      'price': price,
      'colorsList': colorsList,
      'sizeList': sizeList,
      'isFavourite': isFavourite,
      'discountP': discountP,
    };
  }

  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
      imageUrl: map['imageUrl'] ?? '',
      shoeName: map['shoeName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      colorsList: List.from(map['colorsList']),
      sizeList: List.from(map['sizeList']),
      isFavourite: map['isFavourite'] ?? false,
      discountP: map['discountP']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shoe.fromJson(String source) => Shoe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Shoe(imageUrl: $imageUrl, shoeName: $shoeName, price: $price, colorsList: $colorsList, sizeList: $sizeList, isFavourite: $isFavourite, discountP: $discountP)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shoe &&
        other.imageUrl == imageUrl &&
        other.shoeName == shoeName &&
        other.price == price &&
        listEquals(other.colorsList, colorsList) &&
        listEquals(other.sizeList, sizeList) &&
        other.isFavourite == isFavourite &&
        other.discountP == discountP;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        shoeName.hashCode ^
        price.hashCode ^
        colorsList.hashCode ^
        sizeList.hashCode ^
        isFavourite.hashCode ^
        discountP.hashCode;
  }
}
