import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/Menu.dart';
import 'package:snappfood_app/main.dart';





class DataSearch extends SearchDelegate<String> {

  static List<String> _resturant = [];

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

  return tags(_resturant.firstWhere((element) => element.startsWith(query)).toString(), "https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg");
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


  static tags(String name,String photo){

    _resturant.add(name);

    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.topRight,
        width: 600,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        child: Column(

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.network(photo,height: 200.0,width: 600.0,alignment: Alignment.topRight,),
            Text(name,textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.black),),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RaisedButton(
                      child: Text("سفارش مجدد",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                      onPressed: null,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),
                  Spacer(),
                  RaisedButton(
                      child: Text("مشاهده فاکتور",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                      onPressed: null,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
                  )

                ],
              ),
            )

          ],
        )
    );

  }


}