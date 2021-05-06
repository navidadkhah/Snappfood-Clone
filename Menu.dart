import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snappfood_app/New.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("صفحه اصلی",style: TextStyle(fontWeight: FontWeight.bold ),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Snapp Fodd',style: TextStyle(fontSize: 18.0),),
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

              },
            ),
             ListTile(
               title: Text("رستوران های مورد علاقه",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold ),),
               onTap: () {

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tags("عطاویچ","https://s01.sgp1.cdn.digitaloceanspaces.com/article/143395-pysnzzzleh-1593090551.jpg"),
              tags("هات چیک","https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190123071624-fried-chicken-stock.jpg"),
              tags("شیلا","https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg"),
            ],
          ),
        ),


         ),
      persistentFooterButtons: <Widget>[
   Row(

     children: [
       new IconButton(icon: new Icon(Icons.timer) ),
       new IconButton(icon: new Icon(Icons.people))  ,
       new IconButton(icon: new Icon(Icons.map)),
     ],
       ),


      ],
        );


  }

}

class Etebar extends StatefulWidget {
  @override
  _EtebarState createState() => _EtebarState();
}

class _EtebarState extends State<Etebar> {
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
