import 'package:flutter/material.dart';

import 'login.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromRGBO(229, 202, 119, 30),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
            children: [
              _signupImage(context),
              _header(context),
              _inputFeild(context),
              _elevateButton(context),
              _signIn(context),
              _otherConnect(context),
            ]
        ),
      ),
    ),
    );
  }

  _signupImage(context){
    return Center(
      child: Container(
        child: const Image(image: AssetImage("assets/loginAndSignin/signin.png"),
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  _header(context) {
    return Container(
      width: 600,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Register",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              textAlign: TextAlign.left),
          Text("Please Register Into Continue",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  _inputFeild(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              hintText: "User Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme
                  .of(context)
                  .primaryColorLight
                  .withOpacity(0.2),
              filled: true,
              prefixIcon: Icon(Icons.person)
          ),
        ),
        SizedBox(height: 10),

        TextField(
          decoration: InputDecoration(
              hintText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              fillColor: Theme
                  .of(context)
                  .primaryColorLight
                  .withOpacity(0.2),
              filled: true,
              prefixIcon: Icon(Icons.phone)
          ),
        ),
        SizedBox(height: 10,),

        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            fillColor: Theme
                .of(context)
                .primaryColorLight
                .withOpacity(0.2),
            filled: true,
            prefixIcon: Icon(Icons.lock_rounded),
            suffixIcon: Icon(Icons.remove_red_eye_outlined),
          ),
          obscureText: true,
        ),
        SizedBox(height: 30,)
      ],
    );
  }


  _elevateButton(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(onPressed: (){}, child:Text("Sign Up",style: TextStyle(fontSize: 20),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape:MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)) ,
          ),
        ),
      ],
    );
  }

  _signIn(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Allready have an account?",style: TextStyle(fontSize: 18),),
        TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
                return login();
              }
          ));
        }, child:Text("Sign In")),
      ],
    );
  }

  _otherConnect(context){
    return Column(
      children: <Widget>[
        Text("Or Connect With",style: TextStyle(fontSize: 18)),

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/loginAndSignin/google.png")),padding: EdgeInsets.zero,),
            IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/loginAndSignin/facebook.png")),),
          ],
        ),
      ],
    );
  }

}

