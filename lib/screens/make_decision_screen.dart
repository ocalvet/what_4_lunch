import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/widgets/decision_maker.dart';

class MakeDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.getPlaces();
    return Scaffold(
      appBar: AppBar(
        title: Text('Decision'),
      ),
      body: DecisionMaker(),
    );
  }
}

