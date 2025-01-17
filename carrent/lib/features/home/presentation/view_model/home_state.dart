import 'package:carrent/features/home/presentation/view/bottom_view/account_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        // Dashboard view
        const Center(
          child: Text('Welcome to CarRent'),
        ),
        // Available Cars View
        const Center(
          child: Text('Available Cars'),
        ),
        // User Account View
        const AccountView(),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
