Widget buttonPrintTextFieldValues(
    GlobalKey<FormState> keys, BuildContext context) {
  return Consumer<ProviderForTextField>(
    builder: (context, crud, _) => FloatingActionButton(
        heroTag: 'update gist',
        child: Icon(Icons.update),
        onPressed: () {
          keys.currentState.save();
          crud.listFunctionProvider.forEach((element) {
            print(element.str_name);
          });
        }),
  );
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

Widget buttonAddTextFieldCount(
    GlobalKey<FormState> keys, BuildContext context, GetASet parts) {
  return Consumer<ProviderForTextField>(
      builder: (context, crud, _) => FloatingActionButton(
          heroTag: 'update gist',
          child: Icon(Icons.print),
          onPressed: () {
            keys.currentState.save();
            crud.countTextFieldProvider = int.parse(parts.str_name);
          }));
}