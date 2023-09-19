class CatData {
  final String name;
  final int heartCount;

  CatData({
    required this.name,
    required this.heartCount,
  });
}

// 예시 고양이 데이터 리스트
final List<CatData> catData = [
  CatData(name: 'DiDi', heartCount: 9999),
  CatData(name: 'chuchu', heartCount: 8889),
  CatData(name: 'rurnag', heartCount: 5353),
  CatData(name: 'ruru', heartCount: 0),
];
