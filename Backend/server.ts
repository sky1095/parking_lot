import bodyParser from 'body-parser';
import express from 'express';
import mongoose from 'mongoose';
import errorHandler from './errorHandler';
import { addOrUpdateParkingLot, allocateSlot, deallocateSlot } from './parkingLotService';
import { validateSlotAllocation, validateSlotDeallocation } from './validator';

const app = express();
app.use(bodyParser.json());
app.use(errorHandler);

// Connect to MongoDB
const mongodbUsername = process.env.MONGO_USERNAME || 'testuser';
const mongodbPassword = process.env.MONGO_PASSWORD || 'testPassword';
const mongodbHost = process.env.MONGO_HOST || 'localhost';
const mongodbPort = process.env.MONGO_PORT || '27017';
const mongodbDatabase = process.env.MONGO_DATABASE || 'parking';

// MongoDB connection string with authentication
const mongodbConnectionString = `mongodb://${mongodbUsername}:${encodeURIComponent(mongodbPassword)}@${mongodbHost}:${mongodbPort}/${mongodbDatabase}?authSource=admin`;

// Connect to MongoDB
mongoose.connect(mongodbConnectionString)
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

// Endpoint to add or update a parking lot
app.post('/addOrUpdateParkingLot', async (req, res, next) => {
  try {
    const parkingLot = await addOrUpdateParkingLot(req.body);
    res.json(parkingLot);
  } catch (error) {
    next(error);
  }
});

// Allocate parking slot
app.post('/getSlot', validateSlotAllocation, async (req, res, next) => {
  try {
    const allocatedSlot = await allocateSlot(req.body.size);
    res.json(allocatedSlot);
  } catch (error) {
    next(error);
  }
});

// Deallocate parking slot
app.post('/freeSlot', validateSlotDeallocation, async (req, res, next) => {
  try {
    const { size, slot } = req.body;
    await deallocateSlot(size, slot);
    res.json({ success: true });
  } catch (error) {
    next(error);
  }
});

// Start the Express server
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
