# Sticky ListView Flutter

## Introduction

This provides the Sticky ListView Flutter that can help UI further your UI journey


### Demo
[![Watch the video](https://img.youtube.com/vi/6p4f9yhkN4o/0.jpg)](https://www.youtube.com/watch?v=6p4f9yhkN4o)

## Example
```dart
# File: example.dart

  StickyListView(
          itemCount: employeeList.length,
          height: 500,
          pickedIndex: pickedIndex,
          builder: (context, index) => ListItem(
            employee: employeeList[index],
            color: const Color(0xFFF8D784),
          ),
          pickedItem: ListItem(
            employee: employeeList[pickedIndex],
            color: const Color(0xFFEAB543),
          ),
        )
