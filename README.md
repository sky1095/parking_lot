# Parking Lot

A parking lot system designed for frontend and backend

## Table of Contents
- [Parking Lot](#parking-lot)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Technologies](#technologies)
  - [Setup](#setup)
    - [Backend](#backend)
    - [Frontend](#frontend)
  - [Usage](#usage)
    - [Backend](#backend-1)
    - [Frontend](#frontend-1)
  - [Contact](#contact)

## Introduction
This project consists of a backend and a frontend part, aiming to provide a comprehensive solution for managing a parking lot system. The backend is responsible for handling all the business logic and database interactions, whereas the frontend provides a user-friendly interface for users to interact with the system.

## Technologies
- **Backend**: Node.js, Express.js, MongoDB, Mongoose, etc.
- **Frontend**: Flutter, Dart, etc.

## Setup
### Backend
Navigate to the `Backend` directory:
```bash
cd Backend
```
Install the dependencies:
```bash
npm install
```
Set up the environment variables by creating a `.env` file:
```env
MONGO_USERNAME=yourMongoUsername
MONGO_PASSWORD=yourMongoPassword
MONGO_DATABASE=yourDatabaseName
```
Run the application:
```bash
npm start
```

### Frontend
Navigate to the `Frontend` directory:
```bash
cd Frontend
```
Get the Flutter packages:
```bash
flutter pub get
```
Run the application:
```bash
flutter run
```

## Usage
### Backend
The backend provides various API endpoints to interact with the parking lot system, including:

- **/allocateSlot**: Allocate a parking slot
- **/freeSlot**: Free up a parking slot
- **/availableSlots**: Get all available parking slots
- **/allSlotsStatus**: Get the status of all parking slots

You can use tools like `curl`, Postman, or any other HTTP client to make requests to these endpoints.

### Frontend
The frontend provides a user-friendly interface to interact with the parking lot system. It includes a bottom navigation bar with 2 tabs to navigate between different sections of the application.

## Contact
If you have any questions, feel free to contact [Sudhanshu](mailto:sudhanshuyadavofficial@gmail.com).