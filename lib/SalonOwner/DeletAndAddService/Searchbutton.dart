import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(
      BuildContext context){
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.grey,

    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) =>[
    IconButton(onPressed: (){

      if(query.isEmpty){
        close(context, null);
      }
      else{
        query = '';
      }
    }, icon: Icon(Icons.close,size: 24,color: Colors.black,))

  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: ()=>close(context, null),

      icon:Icon(Icons.arrow_back,size: 24,color: Colors.black,));

  @override
  Widget buildResults(BuildContext context)=> Center(
    child: Text("text"),
  );

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> suggestions = [
      'dunia ya warembo',
      'B_Classic',
      'hello',
      'me'
    ];

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context,index){
          final suggestion = suggestions[index];

          return ListTile(
              title: Text(suggestion),
              onTap: (){
                query= suggestion;
                showResults(context);
              });

        });
  }


}
