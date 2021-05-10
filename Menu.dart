import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snappfood_app/Infos.dart';
import 'package:snappfood_app/New.dart';
import 'package:snappfood_app/main.dart';
import 'package:snappfood_app/Infos.dart';
import 'package:snappfood_app/Info.dart';


int price=0;
List<String> _cms = [];
String cm;


class Menu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("صفحه اصلی",style: TextStyle(fontWeight: FontWeight.bold ),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("پروفایل کاربر",style: TextStyle(fontSize: 18.0),),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.zero,
                color: Colors.blue[300],
              ),
            ),
            ListTile(
                title: Text("خانه",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
              onTap: () {
                 Navigator.pushNamed(context, "/menu");
              },
             ),
            ListTile(
              title: Text("افزایش اعتبار",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
              onTap: () {
              Navigator.pushNamed(context, "/etebar");
              },
            ),
            ListTile(
              title: Text("نظرات من",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
              onTap: () {
                Navigator.pushNamed(context, "/comments");
              },
            ),
             ListTile(
               title: Text("رستوران های مورد علاقه",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
               onTap: () {
                 Navigator.pushNamed(context, "/likes");
               },
            ),
                ListTile(
                   title: Text("سبد خرید",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
                onTap: () {

                   },
                ),
          ],
        ),
      ),
        body: SingleChildScrollView(

          child:  Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DataSearch.tags("atawich","https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg",context),
              DataSearch.tags("hot chick","https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190123071624-fried-chicken-stock.jpg",context),
              DataSearch.tags("burger king","https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",context),
              DataSearch.tags("mc donald","https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",context),
              DataSearch.tags("shila","https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",context),
              DataSearch.tags("burger zoghali","https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg",context),
            ],
          ),
        ),


         ),

        );


  }

}

class Etebar extends StatefulWidget {
  @override
  _EtebarState createState() => _EtebarState();
}

class _EtebarState extends State<Etebar> {


  var _formint=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: Text("کیف پول",style: TextStyle(fontWeight: FontWeight.bold),),
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
                    child:  Padding(
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
                          child: Text(price.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                        )
                    ),

                Expanded(
                  child: Form(
                    key: _formint,
                    child:   TextFormField(
                      onSaved: (String value) {
                        var intvalue=int.parse(value);
                        price += intvalue;
                      },
                      textAlign: TextAlign.center,
                      validator:(String value){
                        if(value.isEmpty){
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
                   onPressed: (){
                     setState(() {
                       if(_formint.currentState.validate()) {
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
            onPressed: (){
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


class CmResturant extends StatefulWidget {

  @override
  _CmResturantState createState() => _CmResturantState();
}

class _CmResturantState extends State<CmResturant> {

  var _Form=GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ثبت نظر",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
              key:_Form,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,

                  width: 20.0,
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: ' your comment'),

                        onSaved: (String value){
                          cm=value;
                        },
                        validator: (String value){
                          if(value.isEmpty){
                            return "    FILL";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: (){
                          if(_Form.currentState.validate()){

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



  @override
  Widget build(BuildContext context) {
    return Expanded(
       child: Scaffold(
          appBar: AppBar(
            title: Text("نظرات من",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          backgroundColor: Colors.lightGreen[200],

          body:Padding(
            padding: EdgeInsets.all(20.0),
           child: ListView.builder(
             itemCount: _cms.length,
             itemBuilder: (context, index) {
               return ListTile(
                 title: Text('${_cms[index]}'),
               );
             },
           ),
          )


        ),
    );
  }

}

