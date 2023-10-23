import mongoose, { Document, Schema } from 'mongoose';

interface ISlot extends Document {
  id: string;
  size: string;
  isOccupied: boolean;
}

interface IFloor extends Document {
  number: number;
  slots: ISlot[];
}

interface IParkingLot extends Document {
  name: string;
  location: string;
  floors: IFloor[];
}

const slotSchema = new Schema<ISlot>({
  size: { type: String, required: true },
  isOccupied: { type: Boolean, default: false },
});

const floorSchema = new Schema<IFloor>({
  number: { type: Number, required: true },
  slots: [slotSchema],
});

const parkingLotSchema = new Schema<IParkingLot>({
  name: { type: String, required: true },
  location: { type: String, required: true },
  floors: [floorSchema],
});

const ParkingLot = mongoose.model<IParkingLot>('ParkingLot', parkingLotSchema);

export { ParkingLot, ISlot, IFloor, IParkingLot };
