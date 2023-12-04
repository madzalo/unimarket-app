import 'package:unimarket_app/features/product/data/models/sell_product_model.dart';

abstract class ProductEvent {
  final SellProductModel? sellProductModel;
  const ProductEvent({this.sellProductModel});
}

class SellProduct extends ProductEvent {
  SellProduct(SellProductModel sellProductModel)
      : super(sellProductModel: sellProductModel);
}

class GetProducts extends ProductEvent {
  GetProducts();
}
