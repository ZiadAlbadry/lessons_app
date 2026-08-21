import 'package:flutter/material.dart';
import 'product.dart';
import 'package:lessons_app/models/product_page.dart';

// widget مستخرج (Extracted Widget) - اتعلمناه في سيشن 7
// بدل ما نكرر كارت المنتج كل مرة، عملناه هنا مرة واحدة ونستدعيه من الـ GridView
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      onTap: () {
        // تمرير بيانات عن طريق الـ Constructor - سيشن 7
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage(product: product)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Image.network(
    product.imagePath,
    height: 250,
    width: double.infinity,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;

      return const SizedBox(
        height: 250,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      return const SizedBox(
        height: 250,
        width: double.infinity,
        child: Center(
          child: Icon(
            Icons.image_not_supported,
            size: 50,
            color: Colors.grey,
          ),
        ),
      );
    },
  ),
),

              if (product.discountLabel != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      product.discountLabel!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              Positioned(
                top: 8,
                right: 6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isFavorite ? Colors.red : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              if (product.oldPrice != null) ...[
                Text(
                  "\$${product.oldPrice!.toStringAsFixed(0)}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Text(
                "\$${product.price.toStringAsFixed(0)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: product.oldPrice != null ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
