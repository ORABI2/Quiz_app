import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'Your Awesome';
    } else if (resultScore >= 14) {
      resultText = 'Likeable';
    } else if (resultScore >= 17) {
      resultText = 'Ur Insane';
    } else {
      resultText = 'You are so Bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          
          children: [
            Text(
      resultPhrase ,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ),
    OutlinedButton(onPressed: resetHandler , child: Text('Restart Quiz!!'))
          ],
        ));
  }
}
