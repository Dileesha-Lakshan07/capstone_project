import 'package:flutter/material.dart';

import 'login.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromRGBO(229, 202, 119, 30),
      appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: IconButton(onPressed: () {
            Navigator.pop(context,login());
          }, icon: Icon(Icons.arrow_back_rounded),)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30), // Optional
        child: Column(
          children: <Widget>[
            _userDetail(),
            _petCategory(),
            _petAdding(),
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

  _petAdding(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amberAccent,
            image: DecorationImage(
                image:AssetImage("assets/userProfile/petAdd.jpg"),
                fit: BoxFit.cover),
            ),
          ),

        SizedBox(height: 20,),

        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amberAccent,
            image: DecorationImage(
              image:AssetImage("assets/userProfile/petAdd2.jpg"),
              fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

}