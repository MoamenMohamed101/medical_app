class DoctorModel {
  final String name;
  final String image;
  final String specialty;
  final double rating;
  final int reviews;
  final String availability;
  final double price;

  DoctorModel({
    required this.name,
    required this.image,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.availability,
    this.price = 0,
  });
}
