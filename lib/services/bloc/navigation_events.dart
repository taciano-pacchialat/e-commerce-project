import 'package:e_commerce_project/services/store/product.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class IsLoading extends NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToCategories extends NavigationEvent {}

class NavigateToHelpSupport extends NavigationEvent {}

class NavigateToProductDetail extends NavigationEvent {
  final Product product;

  const NavigateToProductDetail(this.product);

  @override
  List<Object> get props => [product];
}
