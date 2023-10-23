class CreateParkingLotRequestModel {
  final String name;
  final String location;

  const CreateParkingLotRequestModel({
    required this.name,
    required this.location,
  });

  Map<String, dynamic> get createRequestPayload => {
        "name": name,
        "location": location,
        "floors": [
          {
            "number": 0,
            "slots": [
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
            ]
          },
          {
            "number": 1,
            "slots": [
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
            ]
          },
          {
            "number": 2,
            "slots": [
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Small", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Medium", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
              {"size": "Large", "isOccupied": false},
            ]
          }
        ]
      };
}
