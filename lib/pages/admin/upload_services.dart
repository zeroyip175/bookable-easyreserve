import 'package:flutter/material.dart';

class UploadServices extends StatefulWidget {
  const UploadServices({super.key});

  @override
  State<UploadServices> createState() => _UploadServicesState();
}

class _UploadServicesState extends State<UploadServices> {
  final List<String> servicecategory = ["Retail","POS","Engine","Toy"];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                Text("Upload Serveice", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                  ),)
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2.0,),
                borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              "Enter Service Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: Text(
                "Enter Service Price",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price',
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              "Select Category",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: servicecategory.map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ))).toList(),
                    onChanged: ((value)=> setState(() {
                      this.value=value;
                    })),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"), 
                    iconSize: 36, 
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black
                      ),
                      value: value,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              SizedBox(height: 20.0,),
            Container(
              child: Text(
                "Enter Service Detail",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10), 
              ),
              child: TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'What is your service about...',
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff6351ec),
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 200,
                  child: Center(
                    child: Text("Upload", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                      ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}