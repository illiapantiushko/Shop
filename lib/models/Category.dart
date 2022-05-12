class Category {
  final String icon,type, title;

  Category({required this.icon,required this.type, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/dress.svg",
    type: "Dress",
    title: "Сукні",
  ),
  Category(
    icon: "assets/icons/shirt.svg",
    type: "Shirt",
     title: "Сорочки",
  ),
  Category(
    icon: "assets/icons/pants.svg",
     type: "Trouser",
    title: "Штани",
  ),
  Category(
    icon: "assets/icons/Tshirt.svg",
    type: "T-shirts",
    title: "Футболки",
  ),
];
