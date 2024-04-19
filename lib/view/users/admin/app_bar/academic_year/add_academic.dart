import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/batch_yearController/batch_year_Controller.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

addAcademicYearFunction(BuildContext context) {
  final BatchYearController batchYearController=Get.put(BatchYearController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const TextFontWidget(text: 'Add Academic Year',fontsize: 14),
        content: SizedBox(
          height: 110,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: TextFormField(
                   controller:batchYearController. applynewBatchYearContoller,
                    readOnly: true,
                    onTap: () {
                      batchYearController. selectDate(context);
                    },
                   
                    decoration: const InputDecoration(
                      labelText: 'DD-MM-YYYY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_downward_outlined),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                  controller:batchYearController. selectedToDaterContoller,
                    readOnly: true,
                    onTap: () {
                      batchYearController. selectToDate(context);
                    },
                 
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () async {
              await batchYearController.createBatchYear(context);
              print("object");
            },
          ),
        ],
      );
    },
  );
}



