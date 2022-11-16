import 'package:data_app/dto/Product/product_req_dto.dart';

class Product {
// 변수 앞에 _붙이면 private
  int id;
  String name;
  int price;

  //null을 받을수도 있고 아닐수도 있고
  Product(this.id, this.name, this.price);

  void toProduct(ProductReqDto productReqDto) {
    this.name = productReqDto.name;
    this.price = productReqDto.price;
  }
}
