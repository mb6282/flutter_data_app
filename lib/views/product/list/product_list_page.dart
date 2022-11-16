import 'package:data_app/controller/product_controller.dart';
import 'package:data_app/domain/product/product.dart';
import 'package:data_app/views/product/list/product_list_view_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(productListViewStore);
    final pc = ref.read(productController);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          pc.addProduct(Product(4, "호박", 4000));
        },
      ),
      appBar: AppBar(title: Text("product_list_page")),
      body: ListView.builder(
        itemCount: pm.length,
        itemBuilder: (context, index) => ListTile(
          //상태(ful)가 같을 때 같으면 인식을 못하는데 key로 다르게 인식시킬 수 있음
          //이유 : 상태는 연결되어있지 않고 바깥에서 바인딩됨
          key: ValueKey(pm[index].id),
          onTap: () {},
          leading: Icon(Icons.wallet),
          title: Text(
            "${pm[index].name}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("${pm[index].price}"),
        ),
      ),
    );
  }
}
