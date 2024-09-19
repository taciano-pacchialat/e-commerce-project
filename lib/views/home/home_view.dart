import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/views/home/build_category_card.dart';
import 'package:e_commerce_project/views/home/contact_info.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Charly\'s Hideout',
      body: ListView(
        children: [
          // Welcome section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Your Audio Gear Specialist",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBurgundy),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Expert repairs and premium sales since 2016",
                  style:
                      TextStyle(fontSize: 18, color: AppColors.secondaryGreen),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryGold,
                        textStyle: const TextStyle(
                            color: AppColors.primaryBurgundy,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                      child: const Text("Our Services"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.secondaryGold),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Browse Catalog",
                        style: TextStyle(color: AppColors.primaryBurgundy),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Tabs Section
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: AppColors.primaryBurgundy,
                  tabs: [
                    Tab(
                        child: Text('Repairs',
                            style:
                                TextStyle(color: AppColors.primaryBurgundy))),
                    Tab(
                        child: Text('Sales',
                            style:
                                TextStyle(color: AppColors.primaryBurgundy))),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      // Repairs Tab
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          color: AppColors.primaryCream,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: AppColors.secondaryGold),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expert Repairs",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBurgundy),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "We specialize in repairing all types of audio equipment, from vintage amplifiers to modern digital interfaces. Our home-based workshop is equipped to handle a wide range of issues.",
                                  style: TextStyle(
                                      color: AppColors.secondaryGreen),
                                ),
                                SizedBox(height: 10),
                                Text("• Amplifier and speaker repairs",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• Guitar and bass setups",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• Microphone and preamp servicing",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• Vintage equipment restoration",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Sales Tab
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          color: AppColors.primaryCream,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: AppColors.secondaryGold),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quality Sales",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBurgundy),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "We offer a curated selection of high-quality audio equipment, both new and vintage. Our inventory is hand-picked to ensure the best value and performance for our customers.",
                                  style: TextStyle(
                                      color: AppColors.secondaryGreen),
                                ),
                                SizedBox(height: 10),
                                Text("• Professional-grade microphones",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• Boutique and vintage amplifiers",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• High-end studio monitors",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                                Text("• Rare and collectible instruments",
                                    style: TextStyle(
                                        color: AppColors.secondaryGreen)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Featured Categories Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Featured Categories",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBurgundy),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildCategoryCard(
                        FontAwesomeIcons.guitar, 'Guitars & Basses'),
                    buildCategoryCard(FontAwesomeIcons.bolt, 'Effect Pedals'),
                    buildCategoryCard(
                        FontAwesomeIcons.headphones, 'Audio Gear'),
                  ],
                ),
              ],
            ),
          ),

          // About Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: AppColors.primaryCream,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: AppColors.secondaryGold),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Audio Gear Haven",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBurgundy),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Founded in 2016 by an experienced audio engineer, Audio Gear Haven has been serving the La Plata music community from our home-based workshop.",
                      style: TextStyle(color: AppColors.secondaryGreen),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '"Incredible service and expertise. My vintage amp has never sounded better!" - Maria L.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.accentBrown),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Contact Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get in Touch",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBurgundy),
                ),
                const SizedBox(height: 10),
                Card(
                  color: AppColors.primaryCream,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFFC9A32C)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ContactInfo(
                            icon: FontAwesomeIcons.phone,
                            text: "+54 221 542 4184"),
                        ContactInfo(
                            icon: FontAwesomeIcons.locationDot,
                            text: "La Plata, Buenos Aires"),
                        ContactInfo(
                            icon: FontAwesomeIcons.clock,
                            text: "Mon-Fri: 9AM-6PM, Sat: 10AM-4PM"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.primaryBurgundy,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "© 2023 Charly's Hideout. All rights reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.primaryCream),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
