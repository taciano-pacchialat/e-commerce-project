import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState({
    required this.isLoading,
    this.loadingText = 'Please wait a moment',
  });

  final bool isLoading;
  final String? loadingText;

  @override
  List<Object> get props => [isLoading, loadingText ?? ''];
}

class HomeState extends NavigationState {
  const HomeState({required super.isLoading});
}

class CategoriesState extends NavigationState {
  const CategoriesState({required super.isLoading});
}

class HelpSupportState extends NavigationState {
  const HelpSupportState({required super.isLoading});
}

class ProductDetailState extends NavigationState {
  final String productId;

  const ProductDetailState(this.productId) : super(isLoading: false);

  @override
  List<Object> get props => [productId, isLoading];
}
