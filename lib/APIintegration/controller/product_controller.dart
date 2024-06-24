
import 'package:get/get.dart';

import '../service/http_service.dart';
class productController extends GetxController{
  RxBool isLoding=true.obs; //loading is now observable
  var productList=[].obs;
  @override
  void onInit() {//what should happen  when the app is loaded
   loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    try{
      isLoding(true);
      var product=await HttpService.fetchProducts();//fetch the list of products from http class
      if(product!=null){
        productList.value=product;//now the list having the value and its observabel too
      }
    }finally{
      isLoding(false);
    }
  }
}