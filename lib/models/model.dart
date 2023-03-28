class Beer {
  final String price;
  final String name;
  final Map<String, dynamic> rating;
  final String image;
  final int id;

  Beer({required this.price, required this.name,required  this.rating, required this.image, required this.id});

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      price: json['price'],
      name: json['name'],
      rating: json['rating'],
      image: json['image'],
      id: json['id'],
    );
  }
}

