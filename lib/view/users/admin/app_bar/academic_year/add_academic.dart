import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

addAcademicYearFunction(BuildContext context) {
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
                   // controller: applynewBatchYearContoller,
                    readOnly: true,
                    onTap: () {},
                    // _selectDate(context),
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
                  //  controller: selectedToDaterContoller,
                    readOnly: true,
                    onTap: () {},
                  //  _selectToDate(context),
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
              // await FirebaseFirestore.instance
              //     .collection("SchoolListCollection")
              //     .doc(Get.find<AdminLoginScreenController>().schoolID)
              //     .collection("BatchYear")
              //     .doc(
              //         '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
              //     .set({
              //   'id':
              //       '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
              // }).then((value) {
              //   Navigator.of(context).pop();
              //   Navigator.of(context).pop();
              // });
            },
          ),
        ],
      );
    },
  );
}



