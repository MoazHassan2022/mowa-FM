function [st, sf] = modulation(mt, ct)  
  st = mt.* ct;
  sf = fftshift(fft(st));
end