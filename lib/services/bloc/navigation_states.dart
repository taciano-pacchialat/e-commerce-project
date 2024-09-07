import 'package:e_commerce_project/services/store/product.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class IsLoadingState extends NavigationState {
  const IsLoadingState();
}

class HomeState extends NavigationState {
  const HomeState();
}

class CategoriesState extends NavigationState {
  const CategoriesState();
}

class HelpSupportState extends NavigationState {
  const HelpSupportState();
}

class ProductDetailState extends NavigationState {
  final Product product;
  const ProductDetailState(this.product);

  @override
  List<Object> get props => [product];
}
