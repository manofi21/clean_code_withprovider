import 'package:clean_code_withprovider/getterSetter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'method.dart';

Widget buttonPrintTextFieldValues(
    GlobalKey<FormState> keys, List<GetASet> gettersetter) {
  return FloatingActionButton(
        heroTag: 'update gist',
        child: Icon(Icons.update),
        onPressed: () {
          keys.currentState.save();
          gettersetter.forEach((element) {
            print(element.str_name);
          });
        });
}

Widget textFormFields({String initialValue, Function onSaved}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: new TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(border: OutlineInputBorder()),
    ),
  );
}

// class WidgetShowForm {
//   final GlobalKey<FormState> keys;
//   final GetASet getter;
//   final BuildContext context;
//   WidgetShowForm(this.keys, this.getter, this.context);

//   void modalDialogItem(Widget widgets) {
//     // need context
//     AlertDialog alerts = AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         titlePadding: EdgeInsets.zero,
//         content: Container(
//             height: MediaQuery.of(context).size.height / 3,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: [
//                 Form(
//                     key: keys,
//                     child: textFormFields(
//                       initialValue: "1",
//                       onSaved: Valid(getter).saver,
//                     )),
//                 widgets
//               ],
//             )));
//     showDialog(context: context, builder: (BuildContext context) => alerts);
//   }

//   Widget showForm() {
//     return FloatingActionButton(
//               onPressed: () => modalDialogItem(
//                   buttonUpdateTextFieldCount(() {
//                 // need keys
//                 keys.currentState.save();
//                 // need getter setter
//                 print(getter.str_name);
//                 crud.countTextFieldProvider = int.parse(getter.str_name);
//               })),
//               child: Icon(Icons.add),
//             );
//   }

//   Widget buttonUpdateTextFieldCount(VoidCallback voidCallback) {
//     return FloatingActionButton(
//         heroTag: 'update gist',
//         child: Icon(Icons.print),
//         onPressed: voidCallback);
//   }
// }
