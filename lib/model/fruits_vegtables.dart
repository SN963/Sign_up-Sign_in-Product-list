class FruitsAndVegs {
  String id;
  String imagename;
  String name;
  double price;
  String title;
  late bool isFavourite;
  String description;
  FruitsAndVegs(
      {required this.imagename,
      required this.name,
      required this.price,
      required this.description,
      required this.title,
      required this.id,
      this.isFavourite = false});
}
