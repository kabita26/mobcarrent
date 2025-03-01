import 'package:car_rent/features/home/presentation/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_detail_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Cars')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter search query...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _controller.text;
                    if (query.isNotEmpty) {
                      context.read<SearchCubit>().search(query);
                    }
                  },
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.error.isNotEmpty) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else if (state.results.isEmpty) {
                    return const Center(child: Text('No results found.'));
                  }
                  return ListView.builder(
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final car = state.results[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: car.imageUrls.isNotEmpty
                              ? Image.network(car.imageUrls.first, width: 50, height: 50, fit: BoxFit.cover)
                              : const Icon(Icons.directions_car),
                          title: Text('${car.brand} ${car.model}'),
                          subtitle: Text('\$${car.regularPrice.toStringAsFixed(2)}'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CarDetailView(car: car)));
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
