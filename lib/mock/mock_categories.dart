import 'package:e_commerce_project/services/store/category.dart';

class MockCategories {
  static final List<Category> categories = [
    Category(
      name: "Guitars",
      items: 120,
      subCategories: [
        Category(name: "Electric Guitars", items: 60),
        Category(name: "Acoustic Guitars", items: 40),
        Category(name: "Bass Guitars", items: 20),
      ],
    ),
    Category(
      name: "Audio",
      items: 45,
      subCategories: [
        Category(name: "Headphones", items: 25),
        Category(name: "Speakers", items: 20),
      ],
    ),
    Category(
      name: "Amplifiers",
      items: 80,
      subCategories: [
        Category(name: "Guitar Amps", items: 50),
        Category(name: "Bass Amps", items: 30),
      ],
    ),
    Category(
      name: "Effects Pedals",
      items: 200,
      subCategories: [
        Category(name: "Distortion", items: 70),
        Category(name: "Reverb", items: 50),
        Category(name: "Delay", items: 80),
      ],
    ),
    Category(
      name: "Accessories",
      items: 150,
      subCategories: [
        Category(name: "Strings", items: 50),
        Category(name: "Cables", items: 50),
        Category(name: "Stands", items: 50),
      ],
    ),
  ];
}
