import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/booking_cubit.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
  void initState() {
    super.initState();
    context.read<BookingCubit>().fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.bookings.isEmpty) {
            return const Center(child: Text('No bookings available.'));
          }
          return ListView.builder(
            itemCount: state.bookings.length,
            itemBuilder: (context, index) {
              final car = state.bookings[index];
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
                      : const Icon(Icons.book),
                  title: Text('${car.brand} ${car.model}'),
                  subtitle: Text('\$${car.regularPrice.toStringAsFixed(2)}'),
                  onTap: () {
                    // Optionally, navigate to booking details.
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
