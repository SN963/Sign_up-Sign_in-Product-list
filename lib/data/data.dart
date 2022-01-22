import 'package:flutter_application_6/model/fruits_vegtables.dart';

final _banana = FruitsAndVegs(
    imagename: 'assets/banana.jpg',
    name: 'Banana',
    price: 10.00,
    description: 'Fresh Banana Fruit',
    id: '9',
    title: 'Fruits');
final _orange = FruitsAndVegs(
    imagename: 'assets/orange.jpg',
    name: 'Orange',
    price: 7.50,
    description: 'Fresh Banana Fruit',
    id: '7',
    title: 'Fruits');
final _strawberry = FruitsAndVegs(
    imagename: 'assets/Strawberry.jpg',
    name: 'Strawberry',
    price: 20.00,
    description: 'Fresh Strawberry Fruit',
    id: '2',
    title: 'Fruits');
final _pomegranate = FruitsAndVegs(
    imagename: 'assets/pomegranate.jpg',
    name: 'Pomegranate',
    price: 15.00,
    description: 'Fresh Pomegranate Fruit',
    id: '6',
    title: 'Fruits');
final _tomato = FruitsAndVegs(
    imagename: 'assets/tomato.jpg',
    name: 'Tomato',
    price: 8.00,
    description: 'Fresh Tomato Vegetable',
    id: '11',
    title: 'Vegetables');
final _carrot = FruitsAndVegs(
    imagename: 'assets/carrots.jpg',
    name: 'Carrot',
    price: 6.00,
    description: 'Fresh carrot Vegetable',
    id: '14',
    title: 'Vegetables');
final _cucumber = FruitsAndVegs(
    imagename: 'assets/cucumber.jpg',
    name: 'Cucumber',
    price: 5.00,
    description: 'Fresh Cucumber Vegetable',
    id: "10",
    title: 'Vegetables');
final List<FruitsAndVegs> dailyFreshList = [_tomato, _carrot, _cucumber];
final List<FruitsAndVegs> freshFruitsList = [
  _banana,
  _orange,
  _pomegranate,
  _strawberry
];
