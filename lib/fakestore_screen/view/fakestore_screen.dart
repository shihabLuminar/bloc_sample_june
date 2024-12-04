import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_bloc.dart';
import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakestoreScreen extends StatelessWidget {
  const FakestoreScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> products = const [
    {
      'image':
          'https://images.pexels.com/photos/29273395/pexels-photo-29273395/free-photo-of-rainy-window-view-in-belfast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Product 1',
      'description': 'This is the description for Product 1.',
      'price': 25.99,
    },
    {
      'image':
          'https://images.pexels.com/photos/29273395/pexels-photo-29273395/free-photo-of-rainy-window-view-in-belfast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Product 2',
      'description': 'This is the description for Product 2.',
      'price': 15.49,
    },
    {
      'image':
          'https://images.pexels.com/photos/29273395/pexels-photo-29273395/free-photo-of-rainy-window-view-in-belfast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Product 3',
      'description': 'This is the description for Product 3.',
      'price': 35.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: BlocBuilder<FakestroreBloc, FakestroreState>(
        builder: (context, state) {
          if (state is FakestoreLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FakestreSuccessState) {
            return ListView.builder(
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(
                          state.productsList[index].image.toString(),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.productsList[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.productsList[index].description
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '\$${state.productsList[index].price!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (state is FakestreExceptionState || state is FakestreFailedState) {
            return Center(
              child: Text("FAilded to fetch products"),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
