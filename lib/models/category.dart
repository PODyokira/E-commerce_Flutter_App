class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(title: "All", image: "images/all.png"),
  Category(title: "Shoes", image: "images/shoes.png"),
  Category(title: "Beauty", image: "images/beauty.png"),
  Category(title: "Woman Fashion", image: "images/image1.png"),
  Category(title: "Jewelry", image: "images/jewelry.png"),
  Category(title: "Men Fashion", image: "images/men.png"),
];

