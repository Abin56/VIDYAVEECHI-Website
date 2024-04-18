import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constantvalidate.dart';

import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class CreateAdmin extends StatelessWidget {
  CreateAdmin({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final adminListWidgets = [
      Text(
        "Create A New Admin",
        style: TextStyle(
            fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 17,
            fontWeight: FontWeight.bold),
      ), //////////////////////..............0
      Container(
        width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
        child: Text(
          "Admin Name",
          style: TextStyle(
              fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
              fontWeight: FontWeight.bold),
        ),
      ), ////////////////////..................1
      Container(
        height: 35,
        width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
        child: TextFormField(
          validator: checkFieldEmpty,
          // autovalidateMode: AutovalidateMode.always,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter some text';

          //   }
          //   return null;
          // },
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            // fillColor: Colors.white,
            border: OutlineInputBorder(),
            hintText: 'Enter Name',
            prefixIcon: Icon(
              Icons.person,
              size: 20,
            ),
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ),
      ), //////////////////////................2
      Container(
          width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
          child: Text(
            "Admin Email",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), //////////////////////..............3
      Container(
        height: 35,
        color: screenContainerbackgroundColor,
        child: TextFormField(
          // autovalidateMode: AutovalidateMode.always,
          validator: checkFieldEmpty,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter some text';

          //   }
          //   return null;
          // },
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Email ID',
            prefixIcon: Icon(
              Icons.email,
              size: 20,
            ),
            contentPadding: EdgeInsets.only(top: 1, bottom: 1),
          ),
        ),
      ), //////////////////////////////............4
      Container(
          height: 35,
          width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
          child: Text(
            "Gender",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), //////////////////////////......................5
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35,
            color: screenContainerbackgroundColor,
            child: DropdownSearch(
              validator: checkFieldEmpty,
              //   validator: (value) {
              //           if (value == null || value.isEmpty) {
              // return 'Please enter some text';

              //           }
              //           return null;
              //         },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      hintText: "Please Select Gender",
                      labelStyle: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                      ),
                      contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                      prefixIcon: Icon(
                        Icons.person_2,
                        size: 20,
                      ))),
              items: const ['Male', 'Female', 'Others'],
            ),
          ),
        ],
      ), ////////////////////////....................6
      Container(
          width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
          child: Text(
            "Phone Number",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), /////////////////////////////....................7
      Container(
        height: 35,
        color: screenContainerbackgroundColor,
        child: TextFormField(
          validator: checkFieldEmpty,
          //   autovalidateMode: AutovalidateMode.always,
          //   validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter some text';

          //   }
          //   return null;
          // },
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android,
                size: 20,
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter Phone Number',
              contentPadding: EdgeInsets.only(top: 5, bottom: 5),
              prefixText: "+91"),
        ),
      ), //////////////////////.............................8
      Container(
          width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
          child: Text(
            "Admin Password",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), ////////////////////////////........................9
      Container(
        height: 35,
        color: screenContainerbackgroundColor,
        child: TextFormField(
          validator: checkFieldEmpty,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
            border: OutlineInputBorder(),
            hintText: 'Enter Password',
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ),
      ), ////////////////////////.....................10
      Container(
          width: ResponsiveWebSite.isMobile(context) ? 80 : 150,
          child: Text(
            "Confirm Password",
            style: TextStyle(
                fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                fontWeight: FontWeight.bold),
          )), ///////////////////////.....................11
      Container(
        height: 35,
        color: screenContainerbackgroundColor,
        child: TextFormField(
          validator: checkFieldEmpty,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
            border: OutlineInputBorder(),
            hintText: 'Confirm Password',
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ),
      ), ///////////////////......................12
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 30, 4, 202),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text('Processing Data')),
            // );
          }
        },
        child: Text(
          'Submit',
          style: TextStyle(
            
              fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
              fontWeight: FontWeight.bold,
              color: cWhite),
        ),
      ), ///////////////////////////......................13
    ];
    return SingleChildScrollView(
      child: ResponsiveWebSite.isMobile(context)
          ? Container(
              color: screenContainerbackgroundColor,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 80,
                        color: screenContainerbackgroundColor,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 25),
                            child: adminListWidgets[
                                0] ///////////////////....................Create New Admin
                            )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 10),
                                    child: adminListWidgets[
                                        1], /////////////////.....................admin name
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: adminListWidgets[
                                            2] ///////////////////...............enter name
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 10),
                                    child: adminListWidgets[
                                        3] ////////////////admin email
                                    ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: adminListWidgets[
                                          4] //////////////////////.................enter email ID
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 10),
                                    child: adminListWidgets[
                                        5] ////////////////............Gender
                                    ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                        width: 200,
                                        color: cWhite,
                                        child: adminListWidgets[
                                            6] ///////////////////////...............Gender select
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 10),
                                    child: adminListWidgets[
                                        7] /////////////////////....................Phone Number
                                    ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: adminListWidgets[
                                          8] /////////////////////////..................Enter Phone number
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 10),
                                    child: adminListWidgets[
                                        9] ////////////////////////.....................Admin Password
                                    ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: adminListWidgets[
                                          10] ///////////////////////.................Enter Password
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: cWhite,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 20,
                                          right: 10),
                                      child: adminListWidgets[
                                          11] ///////////////...............confirm password
                                      ),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: adminListWidgets[
                                            12] ///////////////////////.................Enter Confirm Password
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 15, top: 15),
                        child: adminListWidgets[
                            13] ///////////////////////.................submit button
                        ),
                  ],
                ),
              ),
            ) /////////////////////////////////////////////////////////////////////////////////////////..............mobile view
          : Expanded(
              child: Container(
                color: screenContainerbackgroundColor,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                            width: double.infinity,
                            height: 58,
                            color: screenContainerbackgroundColor,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 40),
                                child: adminListWidgets[
                                    0] ///////////////////..........................Create New Admin
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          // color: screenContainerbackgroundColor,
                          color: cWhite,

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: adminListWidgets[
                                          1], //////////////////////////..............admin name
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: adminListWidgets[
                                            2] ///////////////////////////////...enter name
                                        ),
                                    Expanded(flex: 1, child: Container())
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: cWhite,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: adminListWidgets[
                                          3] ////////////////admin email
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: adminListWidgets[
                                          4] //////////////////////.................enter email ID
                                      ),
                                  Expanded(flex: 1, child: Container())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: cWhite,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: adminListWidgets[
                                          5] ///////////////////................Gender
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: adminListWidgets[
                                          6] /////////////////...............Select gender
                                      ),
                                  Expanded(flex: 1, child: Container()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: cWhite,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: adminListWidgets[
                                          7] //////////////////................Phone Number
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: adminListWidgets[
                                          8] ////////////////////............Enter PHone Number
                                      ),
                                  Expanded(flex: 1, child: Container())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: cWhite,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30),
                                      child: adminListWidgets[
                                          9] ////////////////////..................Admin Password
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: adminListWidgets[
                                          10] ///////////////////////..................Enter password
                                      ),
                                  Expanded(flex: 1, child: Container())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: cWhite,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            left: 30,
                                            right: 30),
                                        child: adminListWidgets[
                                            11] ///////////////.............Confirm Password
                                        ),
                                    Expanded(
                                        flex: 1,
                                        child: adminListWidgets[
                                            12] /////////////////////....................Enter Confirm Password
                                        ),
                                    Expanded(flex: 1, child: Container())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 40, bottom: 25, top: 25),
                          child: adminListWidgets[
                              13] ///////////////////////....................submit button
                          ),
                    ],
                  ),
                ),
              ),
            ), //////////////////////////////////////////////...................web view
    );
  }
}
