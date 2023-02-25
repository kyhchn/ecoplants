import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _searchController = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/logoWithoutText.png')),
        title: SizedBox(
          width: size.width * 0.5,
          height: 25,
          child: TextField(
            style: const TextStyle(fontSize: 10),
            textAlignVertical: TextAlignVertical.center,
            
            controller: _searchController.value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10, bottom: 0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: 'Cari tanaman favorit',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10),
              
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        actionsIconTheme: const IconThemeData(size: 22),
        actions: const [
          Icon(Icons.email_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_none_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.menu),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
      ),
    );
  }
}
