import { Request, Response, NextFunction } from 'express';

function validateSlotAllocation(req: Request, res: Response, next: NextFunction) {
  const { size } = req.body;
  
  if (!size) {
    return res.status(400).json({ error: 'Car size is required' });
  }

  const validSizes = ['Small', 'Medium', 'Large', 'XLarge'];
  if (!validSizes.includes(size)) {
    return res.status(400).json({ error: 'Invalid car size' });
  }

  next();
}

function validateSlotDeallocation(req: Request, res: Response, next: NextFunction) {
  const { size, slot } = req.body;
  
  if (!size || !slot) {
    return res.status(400).json({ error: 'Car size and slot are required' });
  }

  const validSizes = ['Small', 'Medium', 'Large', 'XLarge'];
  if (!validSizes.includes(size)) {
    return res.status(400).json({ error: 'Invalid car size' });
  }

  if (typeof slot !== 'string') {
    return res.status(400).json({ error: 'Invalid slot' });
  }

  next();
}

export { validateSlotAllocation, validateSlotDeallocation };
    