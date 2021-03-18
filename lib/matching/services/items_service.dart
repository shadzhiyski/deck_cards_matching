import 'dart:math';

class ItemsService {
  final List<ItemInfo> _itemNames = const [
    const ItemInfo(name: 'A', type: 'spades'),
    const ItemInfo(name: 'K', type: 'spades'),
    const ItemInfo(name: 'Q', type: 'spades'),
    const ItemInfo(name: 'J', type: 'spades'),
    const ItemInfo(name: '10', type: 'spades'),
    const ItemInfo(name: '9', type: 'spades'),
    const ItemInfo(name: '8', type: 'spades'),
    const ItemInfo(name: '7', type: 'spades'),
    const ItemInfo(name: '6', type: 'spades'),
    const ItemInfo(name: '5', type: 'spades'),
    const ItemInfo(name: '4', type: 'spades'),
    const ItemInfo(name: '3', type: 'spades'),
    const ItemInfo(name: '2', type: 'spades'),
    const ItemInfo(name: 'A', type: 'hearts'),
    const ItemInfo(name: 'K', type: 'hearts'),
    const ItemInfo(name: 'Q', type: 'hearts'),
    const ItemInfo(name: 'J', type: 'hearts'),
    const ItemInfo(name: '10', type: 'hearts'),
    const ItemInfo(name: '9', type: 'hearts'),
    const ItemInfo(name: '8', type: 'hearts'),
    const ItemInfo(name: '7', type: 'hearts'),
    const ItemInfo(name: '6', type: 'hearts'),
    const ItemInfo(name: '5', type: 'hearts'),
    const ItemInfo(name: '4', type: 'hearts'),
    const ItemInfo(name: '3', type: 'hearts'),
    const ItemInfo(name: '2', type: 'hearts'),
    const ItemInfo(name: 'A', type: 'diamonds'),
    const ItemInfo(name: 'K', type: 'diamonds'),
    const ItemInfo(name: 'Q', type: 'diamonds'),
    const ItemInfo(name: 'J', type: 'diamonds'),
    const ItemInfo(name: '10', type: 'diamonds'),
    const ItemInfo(name: '9', type: 'diamonds'),
    const ItemInfo(name: '8', type: 'diamonds'),
    const ItemInfo(name: '7', type: 'diamonds'),
    const ItemInfo(name: '6', type: 'diamonds'),
    const ItemInfo(name: '5', type: 'diamonds'),
    const ItemInfo(name: '4', type: 'diamonds'),
    const ItemInfo(name: '3', type: 'diamonds'),
    const ItemInfo(name: '2', type: 'diamonds'),
    const ItemInfo(name: 'A', type: 'clubs'),
    const ItemInfo(name: 'K', type: 'clubs'),
    const ItemInfo(name: 'Q', type: 'clubs'),
    const ItemInfo(name: 'J', type: 'clubs'),
    const ItemInfo(name: '10', type: 'clubs'),
    const ItemInfo(name: '9', type: 'clubs'),
    const ItemInfo(name: '8', type: 'clubs'),
    const ItemInfo(name: '7', type: 'clubs'),
    const ItemInfo(name: '6', type: 'clubs'),
    const ItemInfo(name: '5', type: 'clubs'),
    const ItemInfo(name: '4', type: 'clubs'),
    const ItemInfo(name: '3', type: 'clubs'),
    const ItemInfo(name: '2', type: 'clubs'),
  ];

  final Random random;

  const ItemsService({this.random});

  List<ItemInfo> getRandomItems(int count) {
    var indices = List.generate(_itemNames.length, (index) => index)
      ..shuffle(random);

    var takenItems =
        indices.take(count).map((index) => _itemNames[index]).toList();

    return (takenItems + takenItems)..shuffle(random);
  }
}

class ItemInfo {
  final String name;
  final String type;

  const ItemInfo({this.name, this.type});
}
