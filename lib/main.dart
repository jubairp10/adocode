import 'package:adacode/login.dart';
import 'package:adacode/themeprovider/themeprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'APIintegration/views/home.dart';
import 'firebasehelper/fbasehelper.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA1-rasrfq7adIFMiLWAEcloH8KfAcWvQo",
          appId:  "1:1019361183317:android:cbd3b3e5f7986cee6b36dc",
          messagingSenderId: '',
          projectId: "padacode-b9fb0",
          storageBucket: 'padacode-b9fb0.appspot.com')
  );
  runApp(
      MaterialApp(home: MultiProvider(
        providers:[
    ChangeNotifierProvider(
        create: (context) => Themeprovider()),
    Provider<Firebaseauth_method>(create: (_)=>Firebaseauth_method( FirebaseAuth.instance)),
    StreamProvider(create: (context)=> context.read<Firebaseauth_method>().authState, initialData: null),



  ],
    child: myapp(),
  )));
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: Provider.of<Themeprovider>(context).themedata,
        home:AuthWrapper(),
    );
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final Firebaseuser= context.watch<User?>();

    if (Firebaseuser != null){
      return home();
    }
    return Login();
  }
}