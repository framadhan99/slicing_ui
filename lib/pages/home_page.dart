import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slicing_ui/app/config/asset_styles.dart';
import 'package:slicing_ui/widgets/sliver_searchbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../app/config/asset_paths.dart';
import '../app/models/produk.dart';
import '../widgets/card/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = const [
    Product(
      imageUrl: AssetPaths.product1,
      title: 'Modern Light Clothes',
      category: 'T-Shirt',
      price: 212.99,
      rating: 5.0,
    ),
    Product(
      imageUrl: AssetPaths.product2,
      title: 'Light Dress Bless',
      category: 'Dress modern',
      price: 162.99,
      rating: 5.0,
    ),
    Product(
      imageUrl: AssetPaths.product3,
      title: 'Urban Leather Top',
      category: 'Leather',
      price: 180.00,
      rating: 5.0,
    ),
    Product(
      imageUrl: AssetPaths.product4,
      title: 'Golden Wrap Dress',
      category: 'Dress',
      price: 129.99,
      rating: 5.0,
    ),
  ];
  final List<Map<String, dynamic>> categories = [
    {"icon": AssetPaths.iconItem, "label": "All Items"},
    {"icon": AssetPaths.iconDress, "label": "Dress"},
    {"icon": AssetPaths.iconTshirt, "label": "T-Shirt"},
    {"icon": AssetPaths.iconJeans, "label": "Jeans"},
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Greeting & Avatar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, Welcome 👋",
                            style: AssetStyles.textRegular,
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Albert Stevano",
                            style: AssetStyles.textBodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AssetPaths.profile),
                    ),
                  ],
                ),
              ),
            ),

            // Sticky Search Bar + Filter Button
            SliverPersistentHeader(pinned: true, delegate: SliverSearchBar()),

            // Category Filter (non-sticky)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: SizedBox(
                  height: 48,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final isActive = selectedIndex == index;
                      final iconColor = isActive ? Colors.white : Colors.black;
                      final textColor = isActive ? Colors.white : Colors.black;
                      final backgroundColor = isActive
                          ? Colors.black
                          : Colors.white;
                      final borderColor = isActive
                          ? Colors.transparent
                          : Colors.grey.shade300;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                categories[index]['icon'],
                                colorFilter: ColorFilter.mode(
                                  iconColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              if (categories[index]['label'] != "")
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    categories[index]['label'],
                                    style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Product List
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: products.length,
                  physics:
                      const NeverScrollableScrollPhysics(), // Biar scroll pakai CustomScrollView
                  shrinkWrap: true, // Penting agar ukuran dihitung sesuai isi
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
