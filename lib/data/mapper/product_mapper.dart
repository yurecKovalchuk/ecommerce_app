import '../../domain/models/product.dart';
import '../../domain/models/product_rating.dart';
import '../dto/product_dto.dart';

extension ProductDTOX on ProductDTO {
  Product toEntity() => Product(
    id: id,
    title: title,
    price: price,
    description: description,
    category: category,
    image: image,
    rating: rating.toEntity(),
  );
}

extension RatingX on Rating {
  ProductRating toEntity() => ProductRating(
    rate: rate,
    count: count,
  );
}
