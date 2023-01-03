import 'package:shopx/models/product.dart';
import 'package:get/get.dart';
import 'package:shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  RemoteServices remoteServices = RemoteServices();

  @override
  void onInit() async {
    fetchProductList();
    super.onInit();
  }

  void fetchProductList() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}
