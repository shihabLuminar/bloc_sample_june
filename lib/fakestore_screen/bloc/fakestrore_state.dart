import 'package:bloc_sample_june/fakestore_screen/models/product_res_model.dart';
import 'package:equatable/equatable.dart';

class FakestroreState extends Equatable {
  const FakestroreState();

  @override
  List<Object> get props => [];
}

final class FakestroreInitial extends FakestroreState {}

final class FakestoreLoadingState extends FakestroreState {}

final class FakestreSuccessState extends FakestroreState {
  List<ProductsResModel> productsList;

  FakestreSuccessState({required this.productsList});

  @override
  List<Object> get props => [productsList];
}

final class FakestreFailedState extends FakestroreState {}

final class FakestreExceptionState extends FakestroreState {}
