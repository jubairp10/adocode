import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../login.dart';
import '../controller/product_controller.dart';
import '../widget/productcustom.dart';
//
// void main(){
//   runApp(GetMaterialApp(home: HttpHome(),));
// }

class home extends StatelessWidget{
  final productController controller=Get.put(productController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Products',style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.black,
         actions: [

           IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.camera)),
           IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.searchengin)),
           PopupMenuButton(itemBuilder: (context){
             return[
               PopupMenuItem(onTap: (){
                 FirebaseAuth.instance.signOut();
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
               },child: Text('Logout',)),

             ];
           }),
         ]
     ),
     body: Column(
       children: [
         Padding(padding: EdgeInsets.all(15),child:
           Row(
             children: [
               Expanded(child: Text('Shop Now',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),))
             ],
           ),),
         Expanded(child: Obx((){
           if(controller.isLoding.value){
             return Center(child: CircularProgressIndicator(),);
           }else{
             return GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150,mainAxisSpacing: 10,crossAxisSpacing: 10),
                 itemBuilder: (context,index){
               return ProductCustom(controller.productList[index]);
                 });
           }
         }))
       ],
     ),
   );
  }
}