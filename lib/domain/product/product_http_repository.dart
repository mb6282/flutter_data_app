import 'package:data_app/domain/product/product.dart';
import 'package:data_app/dto/Product/product_req_dto.dart';
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

  Product updateById(int id, Product productReqDto) {
    //http 통신 코드
    //원래 이 코드는 필요 없음 서버랑 통신하기 때문에
    //fake data로 update해주느라 작성해본 코드
    list = list.map((product) {
      if (product.id == id) {
        product = productReqDto;
        return product;
      } else {
        return product;
      }
    }).toList();
    productReqDto.id = id;
    return productReqDto;
  }

  int deleteById(int id) {
    //http 통신 코드
    list = list.where((product) => product.id != id).toList();
    if (id == 4) {
      return -1;
    } else {
      return 1;
    }
    return 1;
  }
}
