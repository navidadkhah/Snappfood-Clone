import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/infos.dart';

class Info{
  String fname;
  String lname;
  String address;
  String number;
  String password;



  Info(String fname, String lname, String address, String number, String password){
    this.fname=fname;
    this.lname=lname;
    this.address=address;
    this.number=number;
    this.password=password;
  }

   String getfname(){
    return fname;
  }

   String getlname(){
    return lname;
  }

  String getaddress(){
    return address;
  }

  String getnumber(){
    return number;
  }

  String getpassword(){
    return password;
  }


}

