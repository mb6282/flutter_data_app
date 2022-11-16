import 'package:data_app/domain/product/product.dart';
import 'package:data_app/domain/product/product_http_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//의존
final productListViewStore =
    StateNotifierProvider<ProductListViewStore, List<Product>>((ref) {
  return ProductListViewStore(ref.read(productHttpRepository).findAll());
});

class ProductListViewStore extends StateNotifier<List<Product>> {
  //super=findAll
  ProductListViewStore(super.state);

  void onRefresh(List<Product> products) {
    //새로운 값을 받아서 state에 넣은 것
    state = products;
  }

  void addProduct(Product productRespDto) {
    state = [...state, productRespDto];
    //state.add 안됨
    //이유 : 기존 데이터를 변환시키는 것이기 때문에. (깊은 복사) <- 기존 값을 변경하면 감지를 못함
    //기존값에 변화 -> 값 변경감지 됐는지 안 됐는지 알수가 없음
    //복사 = 레퍼런스 주소가 다름, 변경감지가 쉬워짐
  }

  void removeProduct(int id) {
    state = state.where((product) => product.id != id).toList();
  }

  void changeInformation(Product productRespDto) {
    state = state.map((product) {
      if (product.id == productRespDto.id) {
        return productRespDto;
      } else {
        return product;
      }
    }).toList();
  }
}
