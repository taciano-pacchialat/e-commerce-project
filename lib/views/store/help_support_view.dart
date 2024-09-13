import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class HelpSupportView extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "How do I place an order?",
      "answer":
          "To place an order, browse our catalog, select the items you want, add them to your cart, and proceed to checkout. Follow the prompts to enter your shipping and payment information."
    },
    {
      "question": "What payment methods do you accept?",
      "answer":
          "We accept major credit cards (Visa, MasterCard, American Express), PayPal, and Apple Pay."
    },
    {
      "question": "How long does shipping take?",
      "answer":
          "Shipping times vary depending on your location. Standard shipping typically takes 3-5 business days, while express shipping can take 1-2 business days."
    },
    {
      "question": "Do you offer international shipping?",
      "answer":
          "Yes, we offer international shipping to most countries. Shipping costs and delivery times may vary depending on the destination."
    },
    {
      "question": "What is your return policy?",
      "answer":
          "We offer a 30-day return policy for most items. Products must be in their original condition with all packaging and accessories. Please contact us to initiate a return."
    }
  ];

  HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Help & Support',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.primaryCream,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.secondaryGold),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Frequently Asked Questions',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 16),
                      ...faqs.map((faq) => ExpansionTile(
                            title: Text(faq['question']!,
                                style: Theme.of(context).textTheme.bodySmall),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(faq['answer']!,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: AppColors.primaryCream,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.secondaryGold),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'If you have any questions or concerns that aren\'t addressed in our FAQ, please don\'t hesitate to reach out to us via email.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.email,
                              color: AppColors.secondaryGreen),
                          const SizedBox(width: 8),
                          Text('support@audiogear.com',
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
