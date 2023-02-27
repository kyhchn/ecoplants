import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  void Function(String) onSubmitted;
  final Widget image;
  void Function() leadingOnPressed;
  CustomAppBar({
    super.key,
    required this.size,
    required this.appBar,
    required this.leadingOnPressed,
    required this.image,
    required this.onSubmitted,
    required Rx<TextEditingController> searchController,
  }) : _searchController = searchController;

  final Size size;
  final Rx<TextEditingController> _searchController;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
          onPressed: leadingOnPressed,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: image),
      title: SizedBox(
        width: size.width * 0.5,
        height: 25,
        child: TextField(
          style: const TextStyle(fontSize: 10),
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
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
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: Colors.white,
              filled: true),
        ),
      ),
      actionsIconTheme: const IconThemeData(size: 22),
      actions: [
        StackIcon(iconData: Icons.email_outlined, quantity: 5),
        const SizedBox(
          width: 10,
        ),
        StackIcon(iconData: Icons.notifications_none_outlined, quantity: 5),
        const SizedBox(
          width: 10,
        ),
        StackIcon(iconData: Icons.shopping_cart_checkout_outlined, quantity: 5),
        const SizedBox(
          width: 10,
        ),
        const Icon(Icons.menu),
        const SizedBox(
          width: 10,
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
