function [filteredTime, filteredFreq] = demodulation(mt, ct, bandwidth, Fs)  
    st = mt.* ct;
    fc = bandwidth/2;
    [b, a] = butter(3, fc/(Fs/2));
    filteredTime = filter(b, a, st) *2 ;
    filteredFreq = fftshift(fft(filteredTime));
end