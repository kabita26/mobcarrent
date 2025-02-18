import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/wishlist_cubit.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.wishlist.isEmpty) {
            return const Center(child: Text('No items in wishlist.'));
          }
          return ListView.builder(
            itemCount: state.wishlist.length,
            itemBuilder: (context, index) {
              final car = state.wishlist[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: car.imageUrls.isNotEmpty
                      ? Image.network(
                          car.imageUrls.first,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.favorite),
                  title: Text('${car.brand} ${car.model}'),
                  subtitle: Text('\$${car.regularPrice.toStringAsFixed(2)}'),
                  onTap: () {
                    // Optionally navigate to car detail
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
