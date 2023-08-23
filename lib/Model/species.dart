class Species {
  late String englishName;
  late String frenchName;
  late String scientificName;
  late String specie;
  late String englishDescription;
  late String growthCondition;
  late String image1;
  late String image2;
  late String image3;
  late String type;

  // Species() {
  //   this.englishName = 'No Data';
  //   this.frenchName = 'No Data';
  //   this.scientificName = 'No Data';
  //   this.specie = 'No Data';
  //   this.englishDescription = 'No Data';
  //   this.growthCondition = 'No Data';
  //   this.image1 = 'No Data';
  //   this.image2 = 'No Data';
  //   this.image3 = 'No Data';
  // }

  Species({required this.englishName,
    required this.frenchName,
    required this.scientificName,
    required this.specie,
    required this.type,
    required this.englishDescription,
    required this.growthCondition,
    required this.image1,
    required this.image2,
    required this.image3});



  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      englishName: json["English Name"],
      frenchName: json["French Name"],
      scientificName: json["Scientific Name"],
      specie: json["Specie"],
      type: json["Type"],
      englishDescription: json["Description (English)"],
      growthCondition: json["Ideal condition to grow plant"],
      image1: json["Image 1 Url"],
      image2: json["Image 2 Url"],
      image3: json["Image 3 Url"],
    );
  }
}
