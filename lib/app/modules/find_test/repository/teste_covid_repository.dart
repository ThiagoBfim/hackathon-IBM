import 'package:flutter/material.dart';
import 'package:test_life/app/modules/find_test/model/teste_covid.dart';

class CardRepository {
  static List<TestCovid> cardsTest(String searchQuery) {
    var cards = [
      TestCovid(
          title: "Drive-Thru",
          subtitle:
              "Estácionamento UNIEURO - Av. das Castanheiras - Águas Claras",
          icon: Icon(
            Icons.directions_car,
            color: Colors.brown[700],
          ),
          minPrice: 100,
          maxPrice: 500),
      TestCovid(
          title: "Laboratório Sabin",
          subtitle: "Ceilândia St. M QNM 17",
          icon: Icon(
            Icons.local_hospital,
            color: Colors.redAccent[700],
          ),
          minPrice: 100,
          maxPrice: 500),
      TestCovid(
          title: "Laboratório Sabin",
          subtitle: "BS Q 1 Bloco C Loja 16 D - Asa Sul",
          icon: Icon(
            Icons.local_hospital,
            color: Colors.redAccent[700],
          ),
          minPrice: 100,
          maxPrice: 500),
      TestCovid(
          title: "Parque da Cidade",
          subtitle: "Estacionamento 4 - CES - Brasília, DF, 70297-400",
          icon: Icon(
            Icons.directions_car,
            color: Colors.brown[700],
          ),
          minPrice: 100,
          maxPrice: 500),
    ];
    return cards
        .where((element) =>
            element.title.toUpperCase().contains(searchQuery.toUpperCase()) ||
            element.subtitle.toUpperCase().contains(searchQuery.toUpperCase()))
        .toList();
  }
}
