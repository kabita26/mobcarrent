
class GetBookings {
  final CarRepository repository;
  GetBookings(this.repository);

  Future<List<Car>> call() async {
    return repository.getBookings();
  }
}
