import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Charly\'s Hideout',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 200, // Placeholder for the image
                    child: Placeholder(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome to Audio Gear Haven',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF5C1A1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Since 2016, we\'ve been your trusted source for high-quality audio gear repair and sales in La Plata, Buenos Aires.',
                    style: TextStyle(color: Color(0xFF2F4F4F)),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: const Color(0xFFF5F5DC),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFC9A32C)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100, // Placeholder for the founder's image
                            child: Placeholder(),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Meet the Founder',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF5C1A1B),
                                    fontFamily: 'Serif',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Our founder, an experienced engineer with a passion for audio technology, has been dedicated to providing top-notch repair services and curating a selection of premium audio equipment since 2016.',
                                  style: TextStyle(color: Color(0xFF2F4F4F)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Services Section
                  const Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF5C1A1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 1, // Responsive layout for smaller screens
                    childAspectRatio: 3, // Adjust based on the content
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildServiceCard(
                        icon: Icons.build_outlined, // Icon for repairs
                        title: 'Expert Repairs',
                        description:
                            'Professional repair services for all your audio gear needs, regardless of brand.',
                      ),
                      buildServiceCard(
                        icon: Icons.shopping_bag_outlined, // Icon for sales
                        title: 'Quality Sales',
                        description:
                            'Curated selection of premium audio equipment from various brands for sale.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Gallery Section
                  const Text(
                    'Our Workshop',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF5C1A1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2, // 2 images per row
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(4, (index) {
                      return const SizedBox(
                        width: 150,
                        height: 100, // Placeholder for gallery images
                        child: Placeholder(),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),

                  // Contact Section
                  const Text(
                    'Visit Us',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF5C1A1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: const Color(0xFFF5F5DC),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFC9A32C)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildContactRow(Icons.pin_drop_outlined,
                              'La Plata, Buenos Aires'),
                          buildContactRow(Icons.timer_sharp,
                              'Mon-Fri: 9AM-6PM, Sat: 10AM-4PM'),
                          buildContactRow(
                              Icons.phone_outlined, '+54 221 542 4184'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Ready to Explore Section
                  const Text(
                    'Ready to Explore?',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF5C1A1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFC9A32C), // Gold background
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text(
                      'Browse Our Catalog',
                      style: TextStyle(
                        color: Color(0xFF5C1A1B),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFF5C1A1B),
              height: 60.0,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '© 2023 Audio Gear Haven. All rights reserved.',
                    style: TextStyle(color: Color(0xFFF5F5DC)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServiceCard(
      {required IconData icon,
      required String title,
      required String description}) {
    return Card(
      color: const Color(0xFFF5F5DC),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFC9A32C)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, size: 32, color: const Color(0xFF8B4513)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF5C1A1B),
            fontFamily: 'Serif',
          ),
        ),
        subtitle:
            Text(description, style: const TextStyle(color: Color(0xFF2F4F4F))),
      ),
    );
  }

  Widget buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF8B4513)),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Color(0xFF2F4F4F))),
        ],
      ),
    );
  }
}
