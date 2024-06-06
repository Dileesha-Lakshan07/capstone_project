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
              _header(context),
              _inputFeild(context),
              _elevateButton(context),
            ]
        ),
      ),
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

}
