// import 'package:car_rent/features/car_details/data/data_source/car_local_data_source.dart';
// import 'package:car_rent/features/car_details/data/model/car_hive_model.dart';
// import 'package:flutter/material.dart';
// import 'package:car_rent/features/car_details/domain/entity/car_entity.dart';
// import 'package:car_rent/core/network/hive_service.dart';
// import 'package:hive_flutter/adapters.dart';

// class CarView extends StatefulWidget {
//   @override
//   _CarViewState createState() => _CarViewState();
// }

// class _CarViewState extends State<CarView> {
//   late CarLocalDataSource carLocalDataSource;
//   late Future<List<CarEntity>> cars;
  
//   @override
//   void initState() {
//     super.initState();
//     // Initialize HiveService and CarLocalDataSource
//     final hiveService = HiveService(carBox: Hive.box<CarHiveModel>('carBox')); // Initialize with your actual box
//     carLocalDataSource = CarLocalDataSource(hiveService: hiveService);
//     cars = carLocalDataSource.getCar(); // Fetch all cars
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cars List'),
//       ),
//       body: FutureBuilder<List<CarEntity>>(
//         future: cars,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
          
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No cars available.'));
//           }

//           List<CarEntity> carList = snapshot.data!;

//           return ListView.builder(
//             itemCount: carList.length,
//             itemBuilder: (context, index) {
//               CarEntity car = carList[index];
//               return Card(
//                 elevation: 5,
//                 margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                 child: ListTile(
//                   title: Text(car.carName),
//                   subtitle: Text('Car ID: ${car.carId ?? "No ID"}'),
//                   onTap: () {
//                     // On tap, show car details or navigate to another screen
//                     _showCarDetails(context, car);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   void _showCarDetails(BuildContext context, CarEntity car) {
//     // Show car details in a new screen or dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(car.carName),
//           content: Text('Car ID: ${car.carId}\nDetails here...'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
