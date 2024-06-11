import 'package:flutter/material.dart';

class petRegistration extends StatefulWidget {
  const petRegistration({super.key});

  @override
  State<petRegistration> createState() => _petRegistrationState();
}

class _petRegistrationState extends State<petRegistration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromRGBO(229, 202, 119, 30),
      appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_rounded),)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30), // Optional
        child: Column(
          children: <Widget>[
            _userDetail(),
            _petCategory(),
          ],
        ),
      ),
    ),
    );
  }

  _userDetail() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [Text("Hello",textAlign:TextAlign.left,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            Text("Kawidi Rangalla",textAlign:TextAlign.left,style: TextStyle(fontSize: 20,),)],
        ),
        SizedBox(width: 55,),
        Container(color: Colors.amberAccent,
          child: Image(image: AssetImage("assets/loginAndSignin/signin.png"),
            width: 150,
            height: 150,),
        ),
      ],
    );
  }

  _petCategory(){
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Text("Select your pet category",style:TextStyle(fontSize: 25,),),
        SizedBox(height: 10,),
        Row(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            child: IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/userProfile/dog.png")),),
            width: 80,
            height: 80,
          ),
          SizedBox(width: 10,),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amberAccent,
          ),
            child: IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/userProfile/cat.png"),),),
            width: 80,
            height: 80,
          ),
          SizedBox(width: 10,),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amberAccent,
          ),
            child: IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/userProfile/fish.png"),),),
            width: 80,
            height: 80,
          ),
          SizedBox(width: 10,),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amberAccent,
          ),
            child: IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/userProfile/rabbit.png"),),),
            width: 80,
            height: 80,
          ),

        ]),
        SizedBox(height: 20,),
      ],
    );
  }

}