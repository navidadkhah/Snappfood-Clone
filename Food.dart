import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapfood/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InfoFood {
  String name = "";
  String category = "";
  double price = 0;
  String details = "";

  InfoFood(String fname, String category, double price, String detail) {
    this.name = name;
    this.category = category;
    this.price = price;
    this.details = detail;
  }

  String getname() {
    return name;
  }

  String getcategory() {
    return category;
  }

  double getPrice() {
    return price;
  }

  String getDetail() {
    return details;
  }

  void setName(String name) {
    this.name = name;
  }

  void setPrice(double p) {
    this.price = p;
  }

  void setCategory(String cat) {
    this.category = cat;
  }

  void setdetails(String det) {
    this.details = det;
  }
}
