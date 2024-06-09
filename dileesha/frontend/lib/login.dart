import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromRGBO(229, 202, 119, 30),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
            children: [
              _signInPic(context),
              _header(context),
              _inputFeild(context),
              _forgotPassword(context),
              _elevateButton(context),
              _signUp(context),
              _otherConnect(context),
            ]
        ),
      ),
    ),
    );
  }

  _signInPic(context){
    return Container(
      child: const Image(image: AssetImage("assets/loginAndSignin/signin.png"),
        width: 250,
        height: 250,
      ),
    );
  }

  _header(context){
    return Column(
      children: <Widget>[
        Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),textAlign:TextAlign.left),
        Text("Please Sign Into Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ],
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
              fillColor:Theme.of(context).primaryColorLight.withOpacity(0.2),
              filled: true,
              prefixIcon: Icon(Icons.person)
          ),
        ),
        SizedBox(height: 20),

        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            fillColor:Theme.of(context).primaryColorLight.withOpacity(0.2),
            filled: true,
            prefixIcon: Icon(Icons.lock_rounded),
            suffixIcon: Icon(Icons.remove_red_eye_outlined),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  _forgotPassword(context){
    return TextButton(onPressed:(){}, child: const Text("Forgot Password ?"),
      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),);
  }

  _elevateButton(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(onPressed: (){}, child:Text("Sign In",style: TextStyle(fontSize: 20),),
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

  _signUp(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Don't have aan account?",style: TextStyle(fontSize: 18),),
        TextButton(onPressed: (){}, child:Text("Sign Up")),
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
