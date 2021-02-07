class Alergen{
  final String name;
  final String image;

  Alergen(this.name, this.image);

  factory Alergen.fromJson(Map<String, dynamic> json){
    return Alergen(
        json['name'],
        json['image']
    );
  }
}