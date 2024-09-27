import 'package:e_commerce_project/services/store/category.dart';

class MockCategories {
  static final List<Category> categories = [
    Category(
      id: "1",
      name: "Guitars",
      items: 120,
      subCategories: [
        Category(id: "2", name: "Electric Guitars", items: 60),
        Category(id: "3", name: "Acoustic Guitars", items: 40),
        Category(id: "4", name: "Bass Guitars", items: 20),
      ],
    ),
    Category(
      id: "5",
      name: "Audio",
      items: 45,
      subCategories: [
        Category(id: "6", name: "Headphones", items: 25),
        Category(id: "7", name: "Speakers", items: 20),
      ],
    ),
    Category(
      id: "8",
      name: "Amplifiers",
      items: 80,
      subCategories: [
        Category(id: "9", name: "Guitar Amps", items: 50),
        Category(id: "10", name: "Bass Amps", items: 30),
      ],
    ),
    Category(
      id: "11",
      name: "Effects Pedals",
      items: 200,
      subCategories: [
        Category(id: "12", name: "Distortion", items: 70),
        Category(id: "13", name: "Reverb", items: 50),
        Category(id: "14", name: "Delay", items: 80),
      ],
    ),
    Category(
      id: "15",
      name: "Accessories",
      items: 150,
      subCategories: [
        Category(id: "16", name: "Strings", items: 50),
        Category(id: "17", name: "Cables", items: 50),
        Category(id: "18", name: "Stands", items: 50),
      ],
    ),
  ];
}
