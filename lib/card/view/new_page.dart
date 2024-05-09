import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:vidyaveechi_website/card/controller/card_controller.dart';

import '../../view/fonts/google_poppins_widget.dart';

class NewPage extends StatelessWidget {
  final CardController cardController=Get.put(CardController());
   NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GooglePoppinsWidgets(
                  text: '000${cardController.onTapValue.value.toString()}',
                  fontsize: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        cardController.increaseFunction();
                      },
                      child: GooglePoppinsWidgets(
                        text: '+',
                        fontsize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cardController.decreaseFunction();
                      },
                      child: GooglePoppinsWidgets(
                        text: '-',
                        fontsize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          
      
    );
  }
}
