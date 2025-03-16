import 'package:flutter/material.dart';

import 'package:adv_basics/result_screen/summary_items.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData,{super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build( context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            } 
          ).toList(),
        ),
      ),
    );
  }
}