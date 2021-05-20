import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snappfood_app/Infos.dart';
import 'package:snappfood_app/New.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/Infos.dart';
import 'package:snappfood_app/Info.dart';
import 'package:snappfood_app/Foods.dart';
import 'package:snappfood_app/Food.dart';



List<String> _resturant = ["ATAWICH","SUBWAY","BURGER KING","MC DONALD","STARBUCKS","KFC","PIZZA HUT"];
 var rng = new Random();

class Menu extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "صفحه اصلی", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          Row(
            children: [
              IconButton(icon: Icon(Icons.filter_alt), onPressed: () {
                  Navigator.pushNamed(context, "/nazdik");
            }),
              IconButton(icon: Icon(Icons.search), onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
            ],
          ),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("پروفایل کاربر", style: TextStyle(fontSize: 18.0),),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.zero,
                color: Colors.blue[300],
              ),
            ),
            ListTile(
              title: Text("سفارش های پیشین", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/previousorder");
              },
            ),
            ListTile(
              title: Text("افزایش اعتبار", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/etebar");
              },
            ),
            ListTile(
              title: Text("نظرات من", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/comments");
              },
            ),
            ListTile(
              title: Text("رستوران های مورد علاقه", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/likes");
              },
            ),
            ListTile(
              title: Text("سبد خرید", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                    Navigator.pushNamed(context, "/sabad");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DataSearch.asli("ATAWICH","Veggie Sandwich","Bacon Dog","Hamburger","Fries","Fanta","Iatak",
                  "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",
                  context),

              DataSearch.asli("SUBWAY","Tuna","Chicken Slice","Roast Beef","Turkey Breast","Water","Soda",
                  "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i.K41TItzGNE/v1/1000x-1.jpg",
                  context),
              DataSearch.asli("BURGER KING","Whopper","BBQ Bacon Double","Double CheeseBurger","Chicken Burger","Soda","Water",
                  "https://i.pinimg.com/236x/48/36/57/483657203d510776cbf18571c26a44df.jpg",
                  context),
              DataSearch.asli("MC DONALD","Big Mac","Bacon Smokehouse Burger","Triple Cheeseburger","McDouble","Pepsi","Cola",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY0A2ZwzWcTmOynbM9KqCWtF8KRUYOs0YYGw&usqp=CAU",
                  context),
              DataSearch.asli("STARBUCKS","Black Tea","Tea Latte","Mocha","Caramel","Cold Coffee","Java Chip",
                  "https://upload.wikimedia.org/wikipedia/commons/d/d6/Starbucks_logo.jpg",
                  context),
              DataSearch.asli("KFC","2 Piece Combo","3 Piece Combo","5 Piece Combo","Wings Combo","Pepsi","Water",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA0WCkDLoVZXsMFv7jig_CNucDpKjztDTMIQ&usqp=CAU",
                  context),
              DataSearch.asli("PIZZA HUT","Island Tuna","Chicken Royale","Veggie Lover","Deluxe Cheese","Pepsi","Water",
                  "https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",
                  context),
            ],
          ),
        ),


      ),

    );
  }

}



List<String> _cms = [];





class CmResturant extends StatefulWidget {

  @override
  _CmResturantState createState() => _CmResturantState();
}

class _CmResturantState extends State<CmResturant> {

  var _Form = GlobalKey<FormState>();
  String cm;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ثبت نظر",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
              key: _Form,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  width: 20.0,
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: ' your comment'),

                        onSaved: (String value) {
                          cm=value;

                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "    FILL";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_Form.currentState.validate()) {
                            _Form.currentState.save();
                            _cms.add(cm);
                            Future.delayed(const Duration(milliseconds: 500),
                                    () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                });
                          }
                        },
                        child: Text("save"),
                      )
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }
}


class Comments extends StatefulWidget {



  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {

  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("نظرات من",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        ),
        backgroundColor: Colors.lightGreen[200],

        body:Padding(
          padding: EdgeInsets.all(10.0),
          child:ListView.builder(
                itemCount:_cms.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.speaker_notes_rounded,color: Colors.red,semanticLabel: "note",),
                       title: Text("About "+_resturant.elementAt(rng.nextInt(6))+" :",style: TextStyle(fontStyle: FontStyle.italic),),
                       subtitle: Text(_cms[index].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  );
                },
              ),

        )



      ),
    );
    }

}

class Nazdik extends StatefulWidget {
  @override
  _NazdikState createState() => _NazdikState();
}

class _NazdikState extends State<Nazdik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "نزدیک ترین ها", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          Row(
            children: [
              IconButton(icon: Icon(Icons.filter_alt), onPressed: () {
                Navigator.pushNamed(context, "/emtiaz");
              }),
              IconButton(icon: Icon(Icons.search), onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
            ],
          ),

        ],
      ),
        drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("پروفایل کاربر", style: TextStyle(fontSize: 18.0),),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.zero,
            color: Colors.blue[300],
          ),
        ),
        ListTile(
          title: Text("سفارش های پیشین", textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, "/previousorder");
          },
        ),
        ListTile(
          title: Text("افزایش اعتبار", textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, "/etebar");
          },
        ),
        ListTile(
          title: Text("نظرات من", textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, "/comments");
          },
        ),
        ListTile(
          title: Text("رستوران های مورد علاقه", textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, "/likes");
          },
        ),
        ListTile(
          title: Text("سبد خرید", textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, "/sabad");
          },
        ),
      ],
    ),
    ),
    body: SingleChildScrollView(

    child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
    child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DataSearch.asli("BURGER KING","Whopper","BBQ Bacon Double","Double CheeseBurger","Chicken Burger","Soda","Water",
          "https://i.pinimg.com/236x/48/36/57/483657203d510776cbf18571c26a44df.jpg",
          context),

      DataSearch.asli("MC DONALD","Big Mac","Bacon Smokehouse Burger","Triple Cheeseburger","McDouble","Pepsi","Cola",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY0A2ZwzWcTmOynbM9KqCWtF8KRUYOs0YYGw&usqp=CAU",
          context),
    DataSearch.asli("SUBWAY","Tuna","Chicken Slice","Roast Beef","Turkey Breast","Water","Soda",
    "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i.K41TItzGNE/v1/1000x-1.jpg",
    context),

      DataSearch.asli("ATAWICH","Veggie Sandwich","Bacon Dog","Hamburger","Fries","Fanta","Iatak",
          "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",
          context),


      DataSearch.asli("PIZZA HUT","Island Tuna","Chicken Royale","Veggie Lover","Deluxe Cheese","Pepsi","Water",
          "https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",
          context),

    DataSearch.asli("STARBUCKS","Black Tea","Tea Latte","Mocha","Caramel","Cold Coffee","Java Chip",
    "https://upload.wikimedia.org/wikipedia/commons/d/d6/Starbucks_logo.jpg",
    context),

    DataSearch.asli("KFC","2 Piece Combo","3 Piece Combo","5 Piece Combo","Wings Combo","Pepsi","Water",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA0WCkDLoVZXsMFv7jig_CNucDpKjztDTMIQ&usqp=CAU",
    context),



    ],
    ),
    ),


    ),
    );
  }
}


class Emtiaz extends StatefulWidget {
  @override
  _EmtiazState createState() => _EmtiazState();
}

class _EmtiazState extends State<Emtiaz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "برترین ها", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          Row(
            children: [
              IconButton(icon: Icon(Icons.filter_alt), onPressed: () {
                Navigator.pushNamed(context, "/menu");
              }),
              IconButton(icon: Icon(Icons.search), onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
            ],
          ),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("پروفایل کاربر", style: TextStyle(fontSize: 18.0),),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.zero,
                color: Colors.blue[300],
              ),
            ),
            ListTile(
              title: Text("سفارش های پیشین", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/previousorder");
              },
            ),
            ListTile(
              title: Text("افزایش اعتبار", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/etebar");
              },
            ),
            ListTile(
              title: Text("نظرات من", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/comments");
              },
            ),
            ListTile(
              title: Text("رستوران های مورد علاقه", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/likes");
              },
            ),
            ListTile(
              title: Text("سبد خرید", textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/sabad");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DataSearch.asli("STARBUCKS","Black Tea","Tea Latte","Mocha","Caramel","Cold Coffee","Java Chip",
                  "https://upload.wikimedia.org/wikipedia/commons/d/d6/Starbucks_logo.jpg",
                  context),

              DataSearch.asli("KFC","2 Piece Combo","3 Piece Combo","5 Piece Combo","Wings Combo","Pepsi","Water",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA0WCkDLoVZXsMFv7jig_CNucDpKjztDTMIQ&usqp=CAU",
                  context),

              DataSearch.asli("SUBWAY","Tuna","Chicken Slice","Roast Beef","Turkey Breast","Water","Soda",
                  "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i.K41TItzGNE/v1/1000x-1.jpg",
                  context),

              DataSearch.asli("BURGER KING","Whopper","BBQ Bacon Double","Double CheeseBurger","Chicken Burger","Soda","Water",
                  "https://i.pinimg.com/236x/48/36/57/483657203d510776cbf18571c26a44df.jpg",
                  context),

              DataSearch.asli("MC DONALD","Big Mac","Bacon Smokehouse Burger","Triple Cheeseburger","McDouble","Pepsi","Cola",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY0A2ZwzWcTmOynbM9KqCWtF8KRUYOs0YYGw&usqp=CAU",
                  context),


              DataSearch.asli("ATAWICH","Veggie Sandwich","Bacon Dog","Hamburger","Fries","Fanta","Iatak",
                  "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",
                  context),


              DataSearch.asli("PIZZA HUT","Island Tuna","Chicken Royale","Veggie Lover","Deluxe Cheese","Pepsi","Water",
                  "https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",
                  context),


                          ],
          ),
        ),


      ),
    );
  }
}
