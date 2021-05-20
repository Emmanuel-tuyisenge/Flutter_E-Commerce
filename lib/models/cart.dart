import 'package:flutter_ecommerce/core/store.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  //Product field
  ProductModel? _product;

  //Collection of ids - store ids of each item
  final List<int> _itemIds = [];

  //Get product
  ProductModel get product => _product!;

  set product(ProductModel newProduct) {
    // ignore: unnecessary_null_comparison
    assert(newProduct != null);
    _product = newProduct;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _product!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
/*
  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }*/
/*
  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }*/
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.remove(item.id);
  }
}
