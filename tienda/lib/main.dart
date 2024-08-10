import 'package:flutter/material.dart';

void main() {
  runApp(tiendita());
}

class tiendita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda Virtual',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product('Guitarra acustica', 119.99, 'guitarra acustica Marshall'),
    Product('Bateria', 314.99, 'Bateria god'),
    Product('Producto 3', 29.99, 'Descripción del producto 3'),
  ];

  List<Product> _carrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda Virtual'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  _carrito.add(product);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Carrito()));
        },
      ),
    );
  }
}

class Product {
  String name;
  double price;
  String description;

  Product(this.name, this.price, this.description);
}

class Carrito extends StatefulWidget {
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  List<Product> _carrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: ListView.builder(
        itemCount: _carrito.length,
        itemBuilder: (context, index) {
          Product product = _carrito[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _carrito.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          // Realizar compra (por ahora solo un mensaje)
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Compra realizada')));
        },
      ),
    );
  }
}
