import 'package:data_app/domain/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productHttpRepository = Provider((ref) {
  return ProductHttpRepository();
});

class ProductHttpRepository {
  //fake data
  List<Product> list = [
    Product(1, "바나나", 1000),
    Product(2, "딸기", 2000),
    Product(3, "참외", 3000)
  ];

  Product findById(int id) {
    //http 통신 코드
    Product product = list.singleWhere((product) => product.id == id);
    return product;
  }

  List<Product> findAll() {
    //http 통신 코드
    return list;
  }

  //DTO에는 name, price만 들어올 것
  Product insert(Product product) {
    //http 통신 코드
    product.id = 4;
    list = [...list, product];
    return product;
  }

  Product updateById(int id, Product productDto) {
    //http 통신 코드
    //원래 이 코드는 필요 없음 서버랑 통신하기 때문에
    //fake data로 update해주느라 작성해본 코드
    list = list.map((product) {
      if (product.id == id) {
        product = productDto;
        return product;
      } else {
        return product;
      }
    }).toList();
    productDto.id = id;
    return productDto;
  }

  int deleteById(int id) {
    //http 통신 코드
    list = list.where((product) => product.id != id).toList();
    return 1;
  }
}
