import 'package:lessons_app/models/product.dart';

// استخدمت الصورتين المتاحين عندك دلوقتي (home_card.png, shoe_img.png)
// كل ما تضيف صور منتجات حقيقية في assets/images غيّر الـ imagePath هنا
final List<Product> products = [
  const Product(
    id: 1,
    name: "ShineStopper Sunnies",
    imagePath: "assets/images/shoe_img.png",
    price: 90,
    oldPrice: 100,
    discountLabel: "-10%",
  ),
  const Product(
    id: 2,
    name: "Chucklesome Shoes",
    imagePath: "assets/images/home_card.png",
    price: 100,
  ),
  const Product(
    id: 3,
    name: "Purrfectly Wild",
    imagePath: "assets/images/shoe_img.png",
    price: 100,
  ),
  const Product(
    id: 4,
    name: "Brand Name Runner",
    imagePath: "assets/images/home_card.png",
    price: 100,
  ),
];
