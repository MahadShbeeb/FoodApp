import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// import 'package:shopapp/Models/dbs.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  final String category;
  bool isFavourite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.imageURL,
      this.price,
      this.category,
      this.isFavourite = false});

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        id: '2',
        title: 'Shawrma',
        description: 'Slices of chicken',
        price: 155.99,
        imageURL:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.kitchensanctuary.com%2Fchicken-shawarma%2F&psig=AOvVaw2VtQqlFWOawzisIZ4W1D4u&ust=1611256049717000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCICxxO-aq-4CFQAAAAAdAAAAABAJ',
        category: 'Sandwish'),
    Product(
        id: '4',
        title: 'Coctale',
        description: 'Coctale of fruits',
        price: 1665.99,
        imageURL:
            'https://www.google.com/url?sa=i&url=http%3A%2F%2Flaurencariscooks.com%2Fcranberry-gin-cocktail%2F&psig=AOvVaw3HkmtsGVc84Gm5AxGLwWtz&ust=1611256185179000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOiFs6Sbq-4CFQAAAAAdAAAAABAD',
        category: 'Drink'),
    Product(
        id: '3',
        title: 'Konafa',
        description: 'Konafa with arabic cheese',
        price: 1000.99,
        imageURL:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bettycrocker.ae%2Fen%2Frecipes%2Fkonafa-cheesecake&psig=AOvVaw25_mtHYzqIlxqvj7xquqQw&ust=1611256237248000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMipt7ebq-4CFQAAAAAdAAAAABAD',
        category: 'Sweet'),
    Product(
        id: '1',
        title: 'Stick',
        description: 'A lamp slice with vegetables',
        price: 800.99,
        imageURL:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcoolmaterial.com%2Ffood-drink%2Fwebs-best-meat-on-a-stick%2F&psig=AOvVaw07e8m81-_BkIBpfwZ5RTDk&ust=1611256288167000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOjs6cybq-4CFQAAAAAdAAAAABAD',
        category: 'Meat')
  ];

  // DB.indertDB('foods', {'id': '1','title': 'Stack','description': 'A lamp slice with vegetables',
  // 'price': 800.99,'imageurl': '','category':'Meat','isFavourite':false});

  // DB.indertDB('foods', {id: '2',title: 'Shawrma',description: 'Coctale of fruits',
  // price: 155.99,imageURL: '',category:'Sandwish'});
  //
  // DB.indertDB('foods', {id: '3',title: 'Konafa',description: 'Konafa with arabic cheese',
  // price: 1000.99,imageURL: '',category:'Sweet'});

  // Future<void> fetchandsetdata() async {
  //   final dataList = await DB.getData('foods');
  //   _products = dataList
  //       .map(
  //         (item) => Product(
  //           id: item['id'],
  //           title: item['title'],
  //           description: item['description'],
  //           imageURL: item['imageurl'],
  //           price: item['price'],
  //           isFavourite: item['price'],
  //           category: item['category'],
  //         ),
  //       )
  //       .toList();
  //   notifyListeners();
  // }

  List<Product> get products {
    return [..._products];
    notifyListeners();
  }

  List<Product> get favouriteproducts {
    return _products.where((element) => element.isFavourite == true).toList();
    notifyListeners();
  }

  List<Product> get meatproducts {
    return _products.where((element) => element.category == 'Meat').toList();
    notifyListeners();
  }

  List<Product> get sweetproducts {
    return _products.where((element) => element.category == 'Sweet').toList();
    notifyListeners();
  }

  List<Product> get sandwishproducts {
    return _products
        .where((element) => element.category == 'Sandwish')
        .toList();
    notifyListeners();
  }

  List<Product> get drinkproducts {
    return _products.where((element) => element.category == 'Drink').toList();
    notifyListeners();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void addProduct(product) {
    _products.add(product);
    notifyListeners();
  }
}
