import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyreserve/pages/services/database.dart';
import 'package:easyreserve/pages/detail_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? serviceStream;

  ontheload()async{
    serviceStream = await DatabaseMethods().getallServices();
    setState(() {
      
    });
  }
  @override
  void initState() {
    ontheload();
    super.initState();
    
  }
  Widget allServices(){
    return StreamBuilder(
      stream: serviceStream, 
      builder: (context, AsyncSnapshot snapshot){
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    DetailPage(
                      image: ds["Image"], 
                      name: ds["Name"], 
                      detail: ds["Detail"], 
                      price: ds["Price"])));
                  },
                  child: Column(
                    children: [
                      Container(
                                    margin: EdgeInsets.only(right: 20.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/images/company_logo/logo.png", 
                          height: 200, 
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, top:5.0),
                          width: 100,
                          decoration: BoxDecoration(color: Colors.white),
                          //change company name here
                            child: Text(
                              "Effect Limited",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),                        
                      ),
                    ],    
                  ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                  Text(ds["Name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(ds["Price"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                                ),
                                ],
                              ),
                              SizedBox(height: 10.0,),
                              Row(children: [
                                Icon(Icons.location_on),
                                //add company location
                                Text(
                  "F/RM D BLK 1 6/F KINGLEY IND BLDG 35 \nYIP KAN STREET WONG CHUK HANG HK",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,)
                                ),
                              ])]),
                );
            })
            :Container();
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xffe3e6ff), Color(0xffe3e6ff), Colors.white], 
        begin: Alignment.topLeft, 
        end: Alignment.bottomRight)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text("Hong Kong", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                SizedBox(height: 30.0,),
                Text("Welcome back!!", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text("There are services\nthat you may choose:", 
            style: TextStyle(
              color: Color(0xff6351ec),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              padding: EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_outlined,
                  ),
                  border: InputBorder.none, hintText: "Search a Location"),
              ),
            ),
            //Service Category 
            SizedBox(height: 20.0,),
            Text("Services Category:", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset("assets/images/retail.png", height: 30,width: 30, fit: BoxFit.cover,),
                          Text("Retail", style: TextStyle(color: Colors.black, fontSize: 20.0),)
                        ],),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset("assets/images/pos.png", height: 30,width: 30, fit: BoxFit.cover,),
                          Text("POS", style: TextStyle(color: Colors.black, fontSize: 20.0),)
                        ],),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset("assets/images/engine.png", height: 30,width: 30, fit: BoxFit.cover,),
                          Text("Engine", style: TextStyle(color: Colors.black, fontSize: 20.0),)
                        ],),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset("assets/images/toy.png", height: 30,width: 30, fit: BoxFit.cover,),
                          Text("Toy", style: TextStyle(color: Colors.black, fontSize: 20.0),)
                        ],),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Company carusol box
            SizedBox(height: 20.0), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Company Services Details", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
              ],
            ),

            allServices(),
            
           ],
        ),
      ),
    );
  }
}