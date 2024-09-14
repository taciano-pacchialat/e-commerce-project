import 'package:e_commerce_project/views/store/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/services/store/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth =
            constraints.maxWidth > 400 ? 400 : constraints.maxWidth;
        double maxHeight =
            constraints.maxHeight > 600 ? 600 : constraints.maxHeight;
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: Card(
              color: AppColors.primaryCream,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.secondaryGold,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              elevation: 4.0,
              child: SizedBox(
                height: maxHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset(
                            product.images[0],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 12.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryGreen,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.unitPrice}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: AppColors.primaryCream,
                                  fontSize: 16.0,
                                ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondaryGold,
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              shape: const LinearBorder(),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailView(product: product)));
                            },
                            child: Text(
                              'View',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
