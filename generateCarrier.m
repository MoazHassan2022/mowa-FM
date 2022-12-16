function [Fc, ct] = generateCarrier(Fs, t, isCos, carrierRatio, phaseShift, decrementFreq)  
  Fc = Fs/carrierRatio; % Fc is less than Fs / 2
  Fc = Fc - decrementFreq;
  ct = (isCos == 1) * cos((2 * pi * Fc * t) + (pi * phaseShift/180.0)) + (isCos == 0) * sin((2 * pi * Fc * t) + (pi * phaseShift/180.0));
end