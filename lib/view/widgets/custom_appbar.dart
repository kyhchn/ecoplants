import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  void Function(String) onSubmitted;
  Color? textFieldColor;
  Widget? leadingWidget;

  CustomAppBar({
    super.key,
    this.textFieldColor,
    required this.appBar,
    required this.onSubmitted,
    this.leadingWidget,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      centerTitle: false,
      backgroundColor: appBar.backgroundColor ?? Utils.primaryColor,
      titleSpacing: 10,
      title: SizedBox(
        width: double.infinity,
        height: 37,
        child: TextField(
          style: const TextStyle(fontSize: 12),
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
          textAlignVertical: TextAlignVertical.center,
          controller: _searchController,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10, bottom: 0),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Colors.black.withOpacity(0.5),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 30),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              hintText: 'Cari Tanaman',
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: textFieldColor ?? Colors.white,
              filled: true),
        ),
      ),
      actionsIconTheme:
          appBar.actionsIconTheme ?? const IconThemeData(size: 22),
      actions: appBar.actions ??
          [
            StackIcon(iconData: Icons.email_outlined, quantity: 5),
            const SizedBox(
              width: 10,
            ),
            StackIcon(iconData: Icons.notifications_none_outlined, quantity: 5),
            const SizedBox(
              width: 10,
            ),
            StackIcon(
                iconData: Icons.shopping_cart_checkout_outlined, quantity: 5),
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
