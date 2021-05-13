import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/Menu.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/Foods.dart';
import 'package:snappfood_app/Food.dart';

int price = 0;
int gheymat=0;

var _form=GlobalKey<FormState>();

 List<String> _resturant = [];
List<String> _food = [];
List<String> _order= [];
List<String> _Porder= [];

class DataSearch extends SearchDelegate<String> {


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return tags(_resturant.firstWhere((element) => element.startsWith(query))
        .toString(),
        "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",
        context);
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? _resturant : _resturant.where((p) =>
        p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.fastfood_rounded),
          title: Text(suggestionList[index]),
        ),
      itemCount: suggestionList.length,
    );
  }


  static tags(String name, String photo, BuildContext context) {
    _resturant.add(name);


    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.topRight,
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        child: Column(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.network(photo, height: 200.0,
              width: 600.0,
              alignment: Alignment.topRight,),


            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
              title: Text(name, textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.0,
                    color: Colors.black),),
              subtitle: ButtonTheme(
                  height: 10.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    child: ElevatedButton(
                      child: Text("Add to favorites"),
                      onPressed: () {
                        if ((_like.indexWhere((element) =>
                        element.toLowerCase() == name) == -1)) {
                          _like.add(name);
                        }
                      },
                    ),
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش مجدد", style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),),
                      onPressed: () {
                   
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))
                  ),
                  Spacer(),
                  RaisedButton(
                      child: Text("مشاهده فاکتور", style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),),
                      onPressed: () {

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر", style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
                onPressed: () {
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );
  }

  static fav(String name, String photo, BuildContext context) {
    _resturant.add(name);


    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.topRight,
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        child: Column(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.network(photo, height: 200.0,
              width: 600.0,
              alignment: Alignment.topRight,),


            ListTile(

              title: Text(name, textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.0,
                    color: Colors.black),),
              subtitle: ButtonTheme(
                  height: 10.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    child: ElevatedButton(
                      child: Text("Remove from favorites"),
                      onPressed: () {
                        _like.remove(name);
                        Navigator.pushNamed(context, "/likes");
                      },
                    ),
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش", style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),),
                      onPressed: () {

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر", style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
                onPressed: () {
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );
  }


  static asli(String name, String ghaza1, String ghaza2, String ghaza3,
      String ghaza4, String drink1, String drink2, String photo,
      BuildContext context) {
    _resturant.add(name);


    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.topRight,
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        child: Column(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.network(photo, height: 200.0,
              width: 600.0,
              alignment: Alignment.topRight,),


            ListTile(

              title: Text(name, textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.0,
                    color: Colors.black),),
              subtitle: ButtonTheme(
                  height: 10.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    child: ElevatedButton(
                      child: Text("Add to favorites"),
                      onPressed: () {
                        if ((_like.indexWhere((element) =>
                        element.toLowerCase() == name) == -1)) {
                          _like.add(name);
                        }
                      },
                    ),
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش", style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),),
                      onPressed: () {
                        for (var i = 0; i < _order.length; i++) {
                         _order.clear();
                        }
                        _OrderState.Constra(
                            name,
                            ghaza1,
                            ghaza2,
                            ghaza3,
                            ghaza4,
                            drink1,
                            drink2);
                        Navigator.pushNamed(context, "/order");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر", style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
                onPressed: () {
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );
  }

 static var rng = new Random();

  static food(BuildContext context,String name, String ghaza1, String ghaza2, String ghaza3,
      String ghaza4, String drink1, String drink2) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(

            children: [
              ListTile(

                leading: IconButton(
                  onPressed: (){
                    _order.add(ghaza1);
                    gheymat+=rng.nextInt(100);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(ghaza1),
                subtitle: Text(
                  '${(rng.nextInt(100))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                tileColor: Colors.grey,
              ),
              ListTile(
                leading:IconButton(
                  onPressed: (){
                    _order.add(ghaza2);
                    gheymat+=rng.nextInt(100);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(ghaza2),
                subtitle: Text(
                  '${(rng.nextInt(100))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),

              ),
              ListTile(
                leading: IconButton(
                  onPressed: (){
                    _order.add(ghaza3);
                    gheymat+=rng.nextInt(100);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(ghaza3),
                subtitle: Text(
                  '${(rng.nextInt(100))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                tileColor: Colors.grey,
              ),
              ListTile(

                leading: IconButton(
                  onPressed: (){
                    _order.add(ghaza4);
                    gheymat+=rng.nextInt(100);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(ghaza4),
                subtitle: Text(
                  '${(rng.nextInt(100))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),

              ),
              ListTile(
                leading: IconButton(
                  onPressed: (){
                    _order.add(drink1);
                    gheymat+=rng.nextInt(50);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(drink1),
                subtitle: Text(
                  '${(rng.nextInt(50))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                tileColor: Colors.grey,
              ),
              ListTile(
                leading: IconButton(
                  onPressed: (){
                    _order.add(drink2);
                    gheymat+=rng.nextInt(50);
                  },
                  icon: Icon(Icons.add,color: Colors.redAccent,),
                ),
                title:  Text(drink2),
                subtitle: Text(
                  '${(rng.nextInt(50))} \$',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),

              ),

                ElevatedButton(
                    onPressed: (){
                      if(gheymat>price){
                     Navigator.pushNamed(context, "/etebar");
                        }
                      else{
                        if ((_Porder.indexWhere((element) =>
                        element.toLowerCase() == name) == -1)){
                          _Porder.add(name);
                        }
                           price-=gheymat;
                           Navigator.pushNamed(context, "/menu");
                           }
                    },
                    child: Text("order"),

                   )
            ]
        )

    );
  }

}




List<String> _like = [

];


class likes extends StatefulWidget {



  @override
  _likesState createState() => _likesState();
}

class _likesState extends State<likes> {
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            leading: Icon(Icons.favorite,color: Colors.purple,),
            backgroundColor: Colors.red,
            title: Text("مورد علاقه ها",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          body: ListView.builder(
            itemCount: _like.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: DataSearch.fav( ('${_like[index]}'), "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg", context),
                          );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, "/menu");
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.arrow_back),
          ),
        );
      }
  }



class Order extends StatefulWidget {
String ghaza1;


  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  static String ghaza1="";
  static String ghaza2="";
  static String ghaza3="";
  static String ghaza4="";
  static String drink1="";
  static String drink2="";
  static String name="";

  static Constra( String esm,String food1,String food2,String food3,String food4,String nosh1,String nosh2){
    name=esm;
    ghaza1=food1;
    ghaza2=food2;
    ghaza3=food3;
    ghaza4=food4;
    drink1=nosh1;
    drink2=nosh2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        backgroundColor: Colors.red,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         DataSearch.food(context,name,  ghaza1, ghaza2, ghaza3, ghaza4, drink1, drink2),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_back,color: Colors.black,),
        onPressed: (){
          Navigator.pushNamed(context, '/menu');
        },
      ),

    );
  }
}


class Sabad extends StatefulWidget {
  @override
  _SabadState createState() => _SabadState();
}

class _SabadState extends State<Sabad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.border_color,color: Colors.black,),
        backgroundColor: Colors.red,
        title: Text("سفارش",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: _order.length,
        itemBuilder: (context, index) {
          return ListTile(

             title: Text('${_order[index]}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_back),
      ),


    );
  }
}



class PreviousOrder extends StatefulWidget {
  @override
  _PreviousOrderState createState() => _PreviousOrderState();
}

class _PreviousOrderState extends State<PreviousOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سفارشات پیشین"),
      ),
      body: ListView.builder(
        itemCount: _Porder.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: DataSearch.tags( ('${_Porder[index]}'), "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg", context),
          );
        },
      ),
    );
  }
}



class Etebar extends StatefulWidget {
  @override
  _EtebarState createState() => _EtebarState();
}

class _EtebarState extends State<Etebar> {


  var _formint = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("کیف پول", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.monetization_on_rounded,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(100.0, 40.0, 100.0, 0),
                child: Text("your money",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 20.0),
                child: Container(
                  margin: const EdgeInsets.all(40.0),
                  padding: const EdgeInsets.all(10.0),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orangeAccent, width: 1)
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(price.toString(), style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),),
                )
            ),

            Expanded(
              child: Form(
                key: _formint,
                child: TextFormField(
                  onSaved: (String value) {
                    var intvalue = int.parse(value);
                    price += intvalue;
                  },
                  textAlign: TextAlign.center,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "   FILL";
                    }
                    return null;
                  },
                  decoration:
                  const InputDecoration(labelText: ' Amount',),
                ),
              ),

            ),


            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formint.currentState.validate()) {
                    _formint.currentState.save();
                    _formint.currentState.reset();
                  }
                });
              },

              child: Text("done"),)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

