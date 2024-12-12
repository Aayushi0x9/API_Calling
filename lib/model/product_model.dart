class ProductModel {
  int? id;
  double? price;
  String? title, description, category, image;
  RatingModel? ratingModel;

  ProductModel(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.image,
      this.ratingModel});

  factory ProductModel.maptomodel(Map m1) => ProductModel(
        image: m1['image'],
        category: m1['category'],
        description: m1['description'],
        id: m1['id'],
        price: m1['price'],
        ratingModel: RatingModel.maptomodel(m1['rating']),
        title: m1['title'],
      );
}

class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.maptomodel(Map m1) => RatingModel(
        count: m1['count'],
        rate: m1['rate'],
      );
}
