


import 'package:flutter/material.dart';

void showLoading(BuildContext context){
 showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context){
      return const SimpleDialog(
        children: [
          CircularProgressIndicator(), 
          SizedBox(height: 10), 
          Text('Aguarde...', textAlign: TextAlign.center,)
        ],
      );
    }
  );
}

void hideLoading(BuildContext context){
    if(Navigator.canPop(context)){
      Navigator.of(context).pop();
    }
}