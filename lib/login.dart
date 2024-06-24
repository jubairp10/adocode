import 'package:adacode/regstration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebasehelper/fbasehelper.dart';
// void main(){
//   runApp(MaterialApp(home:Login(),));
// }





class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  String? email;
  String? password;
  bool showpass = true;

  var formkey = GlobalKey<FormState>();
  @override
  void dispose() {
   _emailcontroller.dispose();
   _passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
          // Image.asset(
          //   "assets/gif/WhatsApp Image 2024-06-04 at 18.12.34_a6ad09de.jpg",
          //   height: 160,
          //   width: 160,
          // ),
          Icon(Icons.person),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 44,
          ),
        ),
        body: Form(
          key: formkey,
          child: ListView(

            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Let\'s\nGet Started!',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w800,fontSize: 40)),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(controller: _emailcontroller,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Email",
                    ),
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains("@") ||
                          !email.contains(".com")) {
                        return "Enter Some value";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (eemail) {
                      email = eemail;
                    }
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(controller: _passwordcontroller,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    obscureText: showpass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.redAccent)),
                        labelText: "Password"),
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "Password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (epass) {
                      password = epass;
                    }
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {

                          Loginuser();
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))),
              ),
              SizedBox(height: 10),

              Center(child: Text("OR",style: TextStyle(color: Colors.grey,fontSize: 20),)),
              SizedBox(height: 10),
              // Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: InkWell(
              //       child: Container(height: 50,
              //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //           decoration: BoxDecoration(color: Colors.black,
              //             borderRadius: BorderRadius.circular(2),
              //           ),
              //
              //           child: Center(
              //             child: Text(
              //               'Use a Sign-In Code',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             ),
              //           )),
              //     )),



              Center(child: Text("Forgot password?",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10),


              SizedBox(height: 10),

              Center(child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> uregistration()));
              },
                  child: Text("Not a user ?Sign up now.",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),))),


              SizedBox(height: 28),


              Text(textAlign: TextAlign.center,"Sign in protected by Google reCAPTCHA to ensure you're\nnot a bot.Learn more",style: TextStyle(color: Colors.grey,),)


            ],
          ),
        )



    );
  }
  void Loginuser() {
    Firebaseauth_method(FirebaseAuth.instance).loginWithEmail(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        context: context);
  }
}