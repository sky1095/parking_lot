import 'dart:convert';

enum ParkingSlotSizeType { small, medium, large }

class ParkingLotModel {
  final String id;
  final String name;
  final String location;
  final List<Floor> floors;

  ParkingLotModel({
    required this.id,
    required this.name,
    required this.location,
    required this.floors,
  });

  ParkingLotModel copyWith({
    String? id,
    String? name,
    String? location,
    List<Floor>? floors,
  }) {
    return ParkingLotModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      floors: floors ?? this.floors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'floors': floors.map((x) => x.toMap()).toList(),
    };
  }

  factory ParkingLotModel.fromMap(Map<String, dynamic> map) {
    return ParkingLotModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      floors: List<Floor>.from(
        (map['floors']).map<Floor>(
          (x) => Floor.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingLotModel.fromJson(String source) =>
      ParkingLotModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OnboardingEntity(id: $id, name: $name, location: $location, floors: $floors)';
  }
}

class Floor {
  final String id;
  final int number;
  final List<Slot> slots;
  Floor({
    required this.id,
    required this.number,
    required this.slots,
  });

  Floor copyWith({
    String? id,
    int? number,
    List<Slot>? slots,
  }) {
    return Floor(
      id: id ?? this.id,
      number: number ?? this.number,
      slots: slots ?? this.slots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'number': number,
      'slots': slots.map((x) => x.toMap()).toList(),
    };
  }

  factory Floor.fromMap(Map<String, dynamic> map) {
    return Floor(
      id: map['_id'] as String,
      number: map['number'].toInt() as int,
      slots: List<Slot>.from(
        (map['slots']).map<Slot>(
          (x) => Slot.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Floor.fromJson(String source) =>
      Floor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Floor(id: $id, number: $number, slots: $slots)';
}

class Slot {
  final String id;
  final ParkingSlotSizeType size;
  final bool isOccupied;
  Slot({
    required this.id,
    required this.size,
    required this.isOccupied,
  });

  Slot copyWith({
    String? id,
    ParkingSlotSizeType? size,
    bool? isOccupied,
  }) {
    return Slot(
      id: id ?? this.id,
      size: size ?? this.size,
      isOccupied: isOccupied ?? this.isOccupied,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'size': size.name,
      'isOccupied': isOccupied,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      id: map['_id'] as String,
      size: ParkingSlotSizeType.values.byName(map['size'].toLowerCase()),
      isOccupied: map['isOccupied'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Slot(id: $id, size: $size, isOccupied: $isOccupied)';
}
