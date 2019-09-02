import 'package:flutter/material.dart';
import 'package:resep_makanan/data/data_model.dart';
import 'package:resep_makanan/ui/detail_screen.dart';

class Breakfast extends StatefulWidget {
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  List<Container> listRecipes = List();

  _doList() async {
    for (var i = 0; i < recipeBreakfast.length; i++) {
      final recipes = recipeBreakfast[i];
      final String image = recipes["image"];
      listRecipes.add(Container(
        padding: EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: <Widget>[
              Hero(
                tag: recipes["name"],
                child: Material(
                  child: InkWell(
                    child: Image.asset("image/$image", fit: BoxFit.cover),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Detail(
                            name: recipes["name"],
                            image: recipes["image"],
                            material: recipes["material"]))),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(recipes["name"], style: TextStyle(fontSize: 14))
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _doList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Meals Catalogue",
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: listRecipes,
      ),
    );
  }
}
