function[signal, t, fSignal, freq, Fs] = readSignal(filename)
    [inputSignal, fs] = audioread(filename);
    Fs = 53040; % making all the sampling frequencies with the same one 
    % to make the same lenth of t, this value is obtained by mapping
    signal = inputSignal(:,1);
    signal = appendZeros(signal, 1060800); % make all the signals with the same length (max length)
    dt = 1/Fs;
    n = length(signal);
    stopTime = 20;
    t = (0:dt:stopTime-dt)';  
    N=size(t,1);
    fSignal = fft(signal, n);
    freq = -Fs/2:(Fs/N):(Fs/2)-(Fs/N);
end