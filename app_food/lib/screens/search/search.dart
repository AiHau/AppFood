import 'package:app_food/config/color.dart';
import 'package:app_food/widgets/single_item.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //void bottomShett() => showModalBottomSheet(context: context, builder: builder)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                // bottomShett();
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
              // onChanged: (value) {
              //   setState(() {
              //     query = value;
              //   });
              // },
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
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),

          // Column(
          //   children: _searchItem.map((data) {
          //     return SingleItem(
          //       isBool: false,
          //       productImage: data.productImage,
          //       productName: data.productName,
          //       productPrice: data.productPrice,
          //     );
          //   }).toList(),
          // )
        ],
      ),
//
    );
  }
}

// class Search extends StatefulWidget {
//   final List<ProductModel> search;
//   Search({this.search});
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   String query = "";

//   searchItem(String query) {
//     List<ProductModel> searchFood = widget.search.where((element) {
//       return element.productName.toLowerCase().contains(query);
//     }).toList();
//     return searchFood;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<ProductModel> _searchItem = searchItem(query);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {
//               },
//               icon: Icon(Icons.sort),
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text("Items"),
//           ),
//           Container(
//             height: 52,
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   query = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Color(0xffc2c2c2),
//                 filled: true,
//                 hintText: "Search for items in the store",
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // Column(
//           //   children: _searchItem.map((data) {
//           //     return SingleItem(
//           //       isBool: false,
//           //       productImage: data.productImage,
//           //       productName: data.productName,
//           //       productPrice: data.productPrice,
//           //     );
//           //   }).toList(),
//           // )
//         ],
//       ),
//     );
//   }
// }
