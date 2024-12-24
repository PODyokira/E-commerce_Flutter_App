import 'package:flutter/material.dart';
import 'package:ecommerce_mobile_app/models/product_model.dart'; // Your Product model
import '../../models/category.dart';
import 'Widget/product_cart.dart';
import 'Widget/home_app_bar.dart';
import 'Widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = all; // Display all products initially
  String selectedCategory = "All"; // Track the currently selected category
  bool isSearching = false; // To toggle between search and main layout

  void _filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        filteredProducts = selectedCategory == "All"
            ? all
            : all
            .where((product) =>
        product.category.toLowerCase() ==
            selectedCategory.toLowerCase())
            .toList();
      });
    } else {
      setState(() {
        isSearching = true;
        filteredProducts = all
            .where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()) &&
            (selectedCategory == "All" ||
                product.category.toLowerCase() ==
                    selectedCategory.toLowerCase()))
            .toList();
      });
    }
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      filteredProducts = category == "All"
          ? all
          : all
          .where((product) =>
      product.category.toLowerCase() == category.toLowerCase())
          .toList();
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const CustomAppBar(),
              const SizedBox(height: 20),
              // Search Bar
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterProducts,
                        decoration: const InputDecoration(
                          hintText: "Search by product name...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _filterProducts('');
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Image Slider
               ImageSlider(
                currentSlide: 0,
                onChange: (_) {},
              ),
              const SizedBox(height: 20),
              // Categories Section
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    final category = categoriesList[index];
                    final isSelected =
                        selectedCategory == category.title; // Highlight selected category
                    return GestureDetector(
                      onTap: () => _filterByCategory(category.title),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(category.image),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              category.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Product Grid
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: filteredProducts[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
