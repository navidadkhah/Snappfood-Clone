import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/Menu.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/Foods.dart';
import 'package:snappfood_app/Food.dart';


var _form=GlobalKey<FormState>();

 List<String> _resturant = [];
List<String> _food = [];

class DataSearch extends SearchDelegate<String> {



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query="";
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

  return tags(_resturant.firstWhere((element) => element.startsWith(query)).toString(), "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",context);
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? _resturant : _resturant.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: (){

        showResults(context);
      },
      leading: Icon(Icons.fastfood_rounded),
          title: Text(suggestionList[index]),
        ),
      itemCount: suggestionList.length,
    );
  }


  static tags(String name,String photo,BuildContext context){

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

            Image.network(photo,height: 200.0,width: 600.0,alignment: Alignment.topRight,),


            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/menu');
              },
              title: Text(name,textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.black),),
             subtitle: ButtonTheme(
               height: 10.0,
              child: ConstrainedBox(
                 constraints: BoxConstraints.tightFor(width: 30, height: 20),
                 child:    ElevatedButton(
                   child: Text("Add to favorites"),
                   onPressed: (){
                     if((_like.indexWhere((element) => element.toLowerCase() == name)==-1)){
                       _like.add(name);
                     }

                   },
                 ),
               )
             ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش مجدد",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                      onPressed: null,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),
                  Spacer(),
                  RaisedButton(
                      child: Text("مشاهده فاکتور",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                      onPressed:(){

                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                onPressed: (){
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );

  }

  static fav(String name,String photo,BuildContext context){

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

            Image.network(photo,height: 200.0,width: 600.0,alignment: Alignment.topRight,),


            ListTile(

              title: Text(name,textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.black),),
              subtitle: ButtonTheme(
                  height: 10.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    child:    ElevatedButton(
                      child: Text("Remove from favorites"),
                      onPressed: (){
                          _like.remove(name);
                          Navigator.pushNamed(context, "/likes");
                      },
                    ),
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                      onPressed: (){

                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                onPressed: (){
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );

  }


  static asli(String name,String photo,BuildContext context){

    _resturant.add(name);
    //Foods.foods.add(Food(1, name, "کباب", "جوجه", "برگ", "چنجه", "دوغ", "دلستر"));

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

            Image.network(photo,height: 200.0,width: 600.0,alignment: Alignment.topRight,),


            ListTile(

              title: Text(name,textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.black),),
              subtitle: ButtonTheme(
                  height: 10.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30, height: 20),
                    child:    ElevatedButton(
                      child: Text("Add to favorites"),
                      onPressed: (){
                        if((_like.indexWhere((element) => element.toLowerCase() == name)==-1)){
                          _like.add(name);
                        }
                      },
                    ),
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                      onPressed:(){
                        Navigator.pushNamed(context, "/order");
                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),

                ],
              ),
            ),
            RaisedButton(
                child: Text("ثبت نظر",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),),
                onPressed: (){
                  Navigator.pushNamed(context, '/CmResturant');
                },

                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
            )
          ],
        )
    );

  }

  static food(String name,String ghaza1, String ghaza2, String ghaza3, String ghaza4, String drink1, String drink2){
    return Container(

   child:Padding(

        padding: EdgeInsets.all(100.0),
        child: Column(
          children: [
            TextButton(
                onPressed:(){} ,
                child:  Text(ghaza1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            TextButton(
              onPressed:(){} ,
              child:  Text(ghaza3,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            ),

          ],
        ),
      ),
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
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سفارش"),
      ),
      body: Column(
        children: [

          DataSearch.food("d",  "کباب", "جوجه", "برگ", "چنجه", "دوغ", "دلستر"),
        ],
      ),
    );
  }
}
