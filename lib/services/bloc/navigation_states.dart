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
  final String productId;

  const ProductDetailState(this.productId);

  @override
  List<Object> get props => [productId];
}
