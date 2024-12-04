import 'package:bloc/bloc.dart';
import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_event.dart';
import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_state.dart';
import 'package:bloc_sample_june/fakestore_screen/models/product_res_model.dart';
import 'package:http/http.dart' as http;

class FakestroreBloc extends Bloc<FakestroreEvent, FakestroreState> {
  FakestroreBloc() : super(FakestroreInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      final url = Uri.parse("https://fakestoreapi.com/products ");

      emit(FakestoreLoadingState());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          emit(FakestreSuccessState(
              productsList: productsResModelFromJson(response.body)));
        } else {
          emit(FakestreFailedState());
        }
      } catch (e) {
        emit(FakestreExceptionState());
      }
    });
  }
}
