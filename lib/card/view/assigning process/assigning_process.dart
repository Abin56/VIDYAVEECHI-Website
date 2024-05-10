import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/card/controller/card_controller.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class AdmissionNumberAssigning extends StatelessWidget {
  final CardController cardController = Get.put(CardController());
  AdmissionNumberAssigning({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration( color: Colors.grey[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                  
                      border: Border.all(width: 1)),
                  child: TextButton(
                    onPressed: () {
                      cardController.increaseFunction();
                    },
                    child: GooglePoppinsWidgets(
                      text: '+',
                      fontsize: 20,
                      color: Colors.red,
                    ),
                  )),
              sw10,
              GooglePoppinsWidgets(
                text: '000${cardController.onTapValue.value.toString()}',
                fontsize: 20,
              ),
              sw20,
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      border: Border.all(width: 1)),
                  child: TextButton(
                    onPressed: () {
                      cardController.decreaseFunction();
                    },
                    child: GooglePoppinsWidgets(
                      text: '-',
                      fontsize: 20,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
