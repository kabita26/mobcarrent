import 'package:car_rent/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.cars.isEmpty) {
            return const Center(child: Text('No car listings available.'));
          }
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().fetchCars(),
            child: ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                final car = state.cars[index];
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
                        : const Icon(Icons.directions_car),
                    title: Text('${car.brand} ${car.model}'),
                    subtitle: Text('\$${car.regularPrice.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailView(car: car),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
