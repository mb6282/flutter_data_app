// VIEW -> Controller 요청
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:data_app/dto/Product/product_req_dto.dart';
import 'package:data_app/main.dart';
import 'package:data_app/views/components/my_alert_dialog_repository.dart';
import 'package:data_app/views/product/list/product_list_view_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productController = Provider((ref) {
  return ProductController(ref);
});

/**
 * 컨트롤러 : 비즈니스 로직 
 * 뷰의 context(레퍼런스)를 알 필요가 없음 (스파게티 구조 방지)
 */
class ProductController {
  final context = navigatorKey.currentContext!;
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

  void deleteById(int id) {
    int result = _ref.read(productHttpRepository).deleteById(id);
    if (result == 1) {
      _ref.read(productListViewStore.notifier).removeProduct(id);
    } else {
      _ref.read(myAlertDialogRepository).showAlert(context, "삭제 실패");
    }
  }

  void changeInformation(int id, Product productReqDto) {
    Product productRespDto =
        _ref.read(productHttpRepository).updateById(id, productReqDto);
    _ref.read(productListViewStore.notifier).changeInformation(productRespDto);
  }
}
