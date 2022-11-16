// VIEW -> Controller 요청
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:data_app/views/product/list/product_list_view_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productController = Provider((ref) {
  return ProductController(ref);
});

class ProductController {
  final Ref _ref;
  ProductController(this._ref);

  void onRefresh() {
    //의존성주입
    List<Product> productList = _ref.read(productHttpRepository).findAll();
    //onRefresh
    _ref.read(productListViewStore.notifier).onRefresh(productList);
  }

  void addProduct(Product productReqDto) {
    Product productRespDto =
        _ref.read(productHttpRepository).insert(productReqDto);
    _ref.read(productListViewStore.notifier).addProduct(productRespDto);
  }
}
