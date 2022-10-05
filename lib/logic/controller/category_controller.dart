import 'package:get/get.dart';
import 'package:shop_app/services/category_services.dart';

import '../../model/product_model.dart';

class CategoryController extends GetxController {
  RxList<String> categoryNameList = <String>[].obs;
  RxList<ProductModel> specificCategoryList = <ProductModel>[].obs;
  RxBool isCategoryLoding = true.obs;
  RxBool isSpecificCategoryLoding = true.obs;
  List imageList = <String>[
    'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg'
  ];

  @override
  void onInit() {
    getCategoryNames();
    super.onInit();
  }

  void getCategoryNames() async {
    var categoryNames = await CategoryServices.getCategory();
    try {
      isCategoryLoding(true);
      if (categoryNames.isNotEmpty) {
        categoryNameList.addAll(categoryNames);
      }
    } finally {
      isCategoryLoding(false);
    }
  }

  getSpecificCategory(String categoryname) async {
    isSpecificCategoryLoding(true);

    specificCategoryList.value =
        await CategoryServices.getSpecificCategory(categoryname);
  }

  getSpecificCategoryIndex(int index) async {
    try {
      await getSpecificCategory(categoryNameList[index]);
    } finally {
      isSpecificCategoryLoding(false);
    }
  }
}
