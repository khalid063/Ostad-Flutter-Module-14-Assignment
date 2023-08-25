

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final DocumentReference matchRef;

  const MatchDetailsScreen({Key? key, required this.matchRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: matchRef.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return const Center(child: Text('This is an Error to fetch data!'),);
        }
        final matchData = snapshot.data!.data() as Map;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              matchData['match_name'],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height/4,
              width: double.infinity,
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        matchData['match_name'],
                        //'Match Name',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            matchData['score_team_a'].toString(),
                            //'5',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            ' : ',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            matchData['score_team_b'].toString(),
                            //'8',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Time : ${matchData['running_time']}",
                        //'Time',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "Total Time : ${matchData['total_time']}",
                        //'Total Time : ',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );;
  }
}

