import 'package:flutter/material.dart';
import 'product_card.dart';
import 'products_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
  "All",
  "Deals",
  "Clothes",
  "Shoes",
  "Best seller",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
  "pants",
     ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Verve",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        actions: const [
          Icon(Icons.search, size: 30),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_rounded, size: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(categories.length, (index) {
                  final isSelected = selectedIndex == index;
                  return ChoiceChip(
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    showCheckmark: false,
                    selectedColor: Colors.black,
                    backgroundColor: Colors.white,
                    label: Text(categories[index]),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Colors.black : Colors.black26,
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_card.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hot Drops",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const Text(
                          "Must have Sneakers",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ActionChip(
                          label: const Text("Find out"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  appBar: AppBar(title: const Text("Best Sellers")),
                                  body: const Center(
                                    child: Text("مرر لتحت في الهوم عشان تشوف المنتجات"),
                                  ),
                                ),
                              ),
                            );
                          },
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          labelStyle: const TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image.asset("assets/images/shoe_img.png"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Sellers",

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("See all", style: TextStyle(color: Colors.indigo)),
              ],
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(height: 200, color: Colors.deepPurpleAccent),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profile");
            },
            splashColor: Colors.green,
            leading: const Icon(Icons.person),
            title: const Text("Profile Page"),
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/settings");
            },
            splashColor: Colors.green,
            leading: const Icon(Icons.settings),
            title: const Text("Setting Page"),
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
          const Divider(),
        ],
      ),
    );
  }
}