curl -X POST http://localhost:3000/addOrUpdateParkingLot \
-H "Content-Type: application/json" \
-d '{
  "name": "Main Street Parking",
  "location": "123 Main Street",
  "floors": [
    {
      "number": 1,
      "slots": [
        {"size": "Small", "isOccupied": false},
        {"size": "Medium", "isOccupied": false},
        {"size": "Large", "isOccupied": false},
        {"size": "XLarge", "isOccupied": false}
      ]
    },
    {
      "number": 2,
      "slots": [
        {"size": "Small", "isOccupied": false},
        {"size": "Medium", "isOccupied": false},
        {"size": "Large", "isOccupied": false},
        {"size": "XLarge", "isOccupied": false}
      ]
    }
  ]
}'
