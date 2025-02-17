
class GetWishlist {
  final CarRepository repository;
  GetWishlist(this.repository);

  Future<List<Car>> call() async {
    return repository.getWishlist();
  }
}
