import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String image, name, detail,price;
  DetailPage({super.key, required this.image,required this.name,required this.detail, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                "assets/images/company_logo/logo.png",
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                ),
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 40.0, left: 30.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black45),
                  child: Column(
                    children: [
                      Text("Effect Limited", style: TextStyle(color: Colors.black87, fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Row(children: [
                        Icon(Icons.phone_android_outlined, color: Colors.white,),
                        Text(
                          "Tel:+852 ", style: TextStyle(
                            color: Color.fromARGB(211, 255, 255, 255),
                            fontSize: 19.0,
                          ),
                        ),
                        SizedBox(width: 150,),
                        Icon(Icons.gps_fixed_outlined, color: Colors.white,),
                        Text(
                          "Location:HK ", style: TextStyle(
                            color: Color.fromARGB(211, 255, 255, 255),
                            fontSize: 19.0,
                          ),
                        ),
                      ],
                      ),
                    ],
                    ),
                ),   
                ],
              ),
            ),
                     
              ],
            ),
            SizedBox(height: 20.0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Our Service",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
          
            SizedBox(height: 10.0,),
            Padding(padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Service Type:\n" + widget.name,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),               
            ),
            SizedBox(height: 10.0,),
            Padding(padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Desciption: \n" + widget.detail,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),               
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Amount: \n" + widget.price,
                style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),               
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: OutlinedButton.icon(
              icon: Icon(Icons.book_online_outlined),
              label: Text("BOOK IT"),
              onPressed: (){

              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}