import { ParkingLot, IParkingLot, ISlot } from './models';

async function allocateSlot(carSize: string): Promise<ISlot> {
  const parkingLot = await ParkingLot.findOne({});

  if (!parkingLot) {
    throw new Error('Parking lot not found');
  }

  for (const floor of parkingLot.floors) {
    for (const slot of floor.slots) {
      if (slot.size === carSize && !slot.isOccupied) {
        slot.isOccupied = true;
        await parkingLot.save();
        return slot;
      }
    }
  }

  // If no slot is available for the requested size, check for larger sizes
  const sizes = ['Small', 'Medium', 'Large', 'XLarge'];
  const requestedSizeIndex = sizes.indexOf(carSize);
  if (requestedSizeIndex === -1) {
    throw new Error('Invalid car size');
  }

  for (let i = requestedSizeIndex + 1; i < sizes.length; i++) {
    const largerSize = sizes[i];
    for (const floor of parkingLot.floors) {
      for (const slot of floor.slots) {
        if (slot.size === largerSize && !slot.isOccupied) {
          slot.isOccupied = true;
          await parkingLot.save();
          return slot;
        }
      }
    }
  }

  throw new Error('No available slot');
}

async function deallocateSlot(carSize: string, slotIdentifier: string): Promise<{ message: string }> {
    const parkingLot = await ParkingLot.findOne({});
  
    if (!parkingLot) {
      throw new Error('Parking lot not found');
    }
  
    const slotIndex = parseInt(slotIdentifier.split('_')[1], 10) - 1;
  
    if (isNaN(slotIndex) || slotIndex < 0) {
      throw new Error('Invalid slot identifier');
    }
  
    for (const floor of parkingLot.floors) {
      if (floor.slots[slotIndex] && floor.slots[slotIndex].size === carSize) {
        if (!floor.slots[slotIndex].isOccupied) {
          return { message: 'Slot is already free' };
        }
        floor.slots[slotIndex].isOccupied = false;
        await parkingLot.save();
        return { message: 'Slot deallocated successfully' };
      }
    }
  
    throw new Error('Slot not found');
  }
  

async function addOrUpdateParkingLot(parkingLotData: IParkingLot): Promise<IParkingLot> {
  if (parkingLotData._id) {
    const parkingLot = await ParkingLot.findByIdAndUpdate(parkingLotData._id, parkingLotData, { new: true });
    if (!parkingLot) {
      throw new Error('Parking lot not found');
    }
    return parkingLot;
  } else {
    const parkingLot = new ParkingLot(parkingLotData);
    await parkingLot.save();
    return parkingLot;
  }
}

export { allocateSlot, deallocateSlot, addOrUpdateParkingLot };
