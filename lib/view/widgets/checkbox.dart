import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CheckBox extends StatelessWidget {
  CheckBox({
    super.key,
    required this.isCheck,
  });

  Rx<bool> isCheck;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Checkbox(
          activeColor: Utils.primaryColor,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          value: isCheck.value,
          onChanged: (val) {
            isCheck.value = val!;
          }),
    );
  }
}
