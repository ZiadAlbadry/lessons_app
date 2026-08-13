// موديل بيانات المنتج - اتعلمناه في سيشن 7 (Typed UI Model)
class Product {
  final int id;
  final String name;
  final String imagePath;
  final double price;
  final double? oldPrice; // null لو مفيش خصم
  final String? discountLabel; // زي "-10%"

  const Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.oldPrice,
    this.discountLabel,
  });
}
