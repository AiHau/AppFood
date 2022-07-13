import 'package:app_food/config/color.dart';
import 'package:app_food/models/product_model.dart';
import 'package:app_food/widgets/single_item.dart';
import 'package:flutter/material.dart';

enum SinginCharacter { lowToHignt, hightToLow, alphabetically }

class Search extends StatefulWidget {
  final List<ProductModel> search;
  const Search({Key? key, required this.search}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SinginCharacter _character = SinginCharacter.alphabetically;
  String query = "";

  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<ProductModel> _searchItem = searchItem(query);
    void bottomShett() => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  'Sort By',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile(
                  value: SinginCharacter.lowToHignt,
                  groupValue: _character,
                  title: const Text('Price - Low to High'),
                  onChanged: (vav) {
                    setState(() {
                      _character = vav as SinginCharacter;
                    });
                    Navigator.of(context).pop();
                  }),
              RadioListTile(
                  value: SinginCharacter.hightToLow,
                  groupValue: _character,
                  title: const Text('Price - High to Low'),
                  onChanged: (vav) {
                    setState(() {
                      _character = vav as SinginCharacter;
                    });
                    Navigator.of(context).pop();
                  }),
              RadioListTile(
                value: SinginCharacter.alphabetically,
                groupValue: _character,
                title: const Text('Alphabetically'),
                onChanged: (vav) {
                  setState(() {
                    _character = vav as SinginCharacter;
                  });
                  Navigator.of(context).pop();
                },
              ),
              Container(
                height: 46,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: primaryColor,
                  child: const Text('Submit'),
                ),
              )
            ],
          );
        });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          title: const Text("Search"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  bottomShett();
                },
                icon: const Icon(Icons.sort),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text("Items"),
            ),
            Container(
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffc2c2c2),
                  filled: true,
                  hintText: "Search for items in the store",
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: _searchItem.map((data) {
                return SingleItem(
                  isBool: false,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productId: data.productId,
                );
              }).toList(),
            )
          ],
        ));
  }
}
