
import 'package:car_rent/features/booking/domain/use_case/create_booking_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/delete_booking_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/get_bookings_usecase.dart';
import 'package:car_rent/features/booking/domain/use_case/update_booking_usecase.dart';
import 'package:car_rent/features/booking/presentation/view/booking_list.dart';
import 'package:car_rent/features/booking/presentation/view_model/booking_bloc.dart';
import 'package:car_rent/features/booking/presentation/view_model/booking_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Car Bookings")),
      body: BlocProvider(
        create: (context) => BookingBloc(
          getBookingsUseCase: GetBookingsUseCase(context.read()),
          createBookingUseCase: CreateBookingUseCase(context.read()),
          updateBookingUseCase: UpdateBookingUseCase(context.read()),
          deleteBookingUseCase: DeleteBookingUseCase(context.read()),
        )..add(GetAllBookingsEvent()),
        child: BookingList(),
      ),
    );
  }
}
