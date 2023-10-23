import 'dart:convert';

enum ParkingSlotSizeType { small, medium, large }

class OnboardingEntity {
  final String id;
  final String name;
  final String location;
  final List<Floor> floors;

  OnboardingEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.floors,
  });

  OnboardingEntity copyWith({
    String? id,
    String? name,
    String? location,
    List<Floor>? floors,
  }) {
    return OnboardingEntity(
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

  factory OnboardingEntity.fromMap(Map<String, dynamic> map) {
    return OnboardingEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      floors: List<Floor>.from(
        (map['floors'] as List<int>).map<Floor>(
          (x) => Floor.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingEntity.fromJson(String source) =>
      OnboardingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

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
      id: map['id'] as String,
      number: map['number'].toInt() as int,
      slots: List<Slot>.from(
        (map['slots'] as List<int>).map<Slot>(
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
      id: map['id'] as String,
      size: map['size'],
      isOccupied: map['isOccupied'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) =>
      Slot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Slot(id: $id, size: $size, isOccupied: $isOccupied)';
}
