# RankingList

## Introduction

This is provide the ranking list view which can help you faster your coding


### Demo
https://drive.google.com/file/d/1YVmRYFRv36nfILjMHtaE8mJyDDRiiDzv/view?usp=sharing

## Example
```dart
# File: example.dart

import 'package:flutter/material.dart';
import 'package:ranking_listview/ranking_list.dart';

import 'employee.dart';

List<Employee> fakeEmployeeList = List.generate(100, (index) {
  return Employee(
    name: 'Employee ${index + 1}',
    description: 'Description for Employee ${index + 1}',
    ranking: 1 + index, // Assigning rankings from 1 to 5 cyclically
    kpi: 50 + (index % 50), // Assigning KPIs from 50 to 99 cyclically
  );
});

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return RankingList(
        height: 600,
        pickedIndex: 12,
        pickedItem: item(fakeEmployeeList[12], Colors.orange),
        builder: (context, index) => item(fakeEmployeeList[index], Colors.white), listSize: fakeEmployeeList.length,);
  }

  Widget item(Employee employee, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: bgColor,
          border: const Border(
              bottom: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.blue))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(employee.ranking.toString()),
              const SizedBox(
                width: 10,
              ),
              Text(employee.name),
            ],
          ),
          Text(employee.kpi.toString()),
        ],
      ),
    );
  }
}
~~~~

