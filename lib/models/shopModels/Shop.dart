import 'package:cenafood/models/others/ActiveState.dart';
import 'package:cenafood/models/ranking/Rating.dart';
import 'package:cenafood/models/shopModels/ShopAccount.dart';
import 'package:cenafood/models/shopModels/ShopCategory.dart';
import 'package:flutter/material.dart';

class Shop {
  int shopId;
  String name;
  DateTime dateStart;
  DateTime dateEnd;
  ActiveState state;
  TimeOfDay timeOpen;
  TimeOfDay timeClose;
  Rating rating;
  ShopAccount shopAccount;
  ShopCategory shopCategory;

  Shop(
      this.shopId,
      this.name,
      this.dateStart,
      this.dateEnd,
      this.state,
      this.timeClose,
      this.timeOpen,
      this.rating,
      this.shopAccount,
      this.shopCategory);
}
