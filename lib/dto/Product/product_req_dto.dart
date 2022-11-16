class ProductReqDto {
// 변수 앞에 _붙이면 private
  String name;
  int price;

  //null을 받을수도 있고 아닐수도 있고
  ProductReqDto(this.name, this.price);
}
