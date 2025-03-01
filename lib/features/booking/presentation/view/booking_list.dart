import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/booking_bloc.dart';
import '../view_model/booking_state.dart';
import '../view_model/booking_event.dart';

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BookingLoaded) {
          return ListView.builder(
            itemCount: state.bookings.length,
            itemBuilder: (context, index) {
              final booking = state.bookings[index];
              return ListTile(
                title: Text(booking.name),
                subtitle: Text("${booking.pickupLocation} → ${booking.dropoffLocation}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Handle update booking
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<BookingBloc>().add(DeleteBookingEvent(booking.id));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is BookingError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text("No bookings found"));
      },
    );
  }
}
