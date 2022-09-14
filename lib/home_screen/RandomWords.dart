import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWords();
}

class _RandomWords extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Startup Name Generator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: buildSuggestion(),

    );
  }

 Widget buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(18),
        itemBuilder: (context, index){
        if(index.isOdd) return Divider();
        final i = index / 2;
        if(i >= _suggestion.length){
          _suggestion.addAll(generateWordPairs().take(15));
        }
        return buildRow(_suggestion[i.toInt()]);
        }
    );
 }

  Widget buildRow(WordPair suggestion) {
    return ListTile(
      title: Text(
        suggestion.asPascalCase
      ),

    );
  }
}
