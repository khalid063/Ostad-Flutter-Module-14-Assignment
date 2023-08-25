

import 'package:flutter/material.dart';

import 'match_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatechListScreen extends StatefulWidget {
  const MatechListScreen({Key? key}) : super(key: key);

  @override
  State<MatechListScreen> createState() => _MatechListScreenState();
}

class _MatechListScreenState extends State<MatechListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main List'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return const Center(child: Text('There is an Error to fetch data!'),);
          }
          final matches = snapshot.data!.docs;
          return ListView.builder(
            itemCount: matches.length,
              itemBuilder: (context, index){
                final match = matches[index];
              return ListTile(
                  title: Text(
                      match['match_name'],
                  ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MatchDetailsScreen(matchRef: match.reference,) ));
                },
              );
              });
        }
      ),
    );
  }
}

class MatchDetailScreen {
}
