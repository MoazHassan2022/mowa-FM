function [Fc, ct] = generateCarrier(Fs, t, isCos, carrierRatio)  
  Fc = Fs/carrierRatio; % Fc is less than Fs / 2
  ct = (isCos == 1) * cos(2 * pi * Fc * t) + (isCos == 0) * sin(2 * pi * Fc * t);
end