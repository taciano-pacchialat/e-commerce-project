import 'package:e_commerce_project/services/store/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Category> categories = [
  Category(
      name: "Guitars", icon: const Icon(FontAwesomeIcons.guitar), items: 120),
  Category(
      name: "Audio", icon: const Icon(FontAwesomeIcons.headphones), items: 45),
  Category(
      name: "Amplifiers",
      icon: const Icon(FontAwesomeIcons.volumeHigh),
      items: 80),
  Category(
      name: "Effects Pedals",
      icon: const Icon(FontAwesomeIcons.sliders),
      items: 200),
  Category(
      name: "Accessories",
      icon: const Icon(FontAwesomeIcons.plane),
      items: 150),
];
