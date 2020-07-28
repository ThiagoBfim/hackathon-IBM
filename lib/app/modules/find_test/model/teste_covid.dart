import 'package:flutter/material.dart';

class TestCovid {
  final Icon icon;
  final String title;
  final String subtitle;
  final TestType typeTest;
  final double minPrice;
  final double maxPrice;

  TestCovid(
      {this.title,
      this.subtitle,
      this.icon,
      this.typeTest,
      this.minPrice,
      this.maxPrice});

  String precoMedio() => "R\$: $minPrice/$maxPrice";
}

enum TestType { PCR, SOROLOGIA, TESTE_RAPIDO }
