function[signal, t, fSignal, freq, Fs] = readSignal(filename)
    [inputSignal,inputFs] = audioread(filename);
    Fs = inputFs;
    signal = inputSignal(:,1);
    % mapping to make the signal and the carrier the same size
    dt = 1/Fs;
    n = length(signal);
    stopTime = 20;
    t = (0:dt:stopTime-dt)';  
    N=size(t,1);
    Fs = (inputFs * length(inputSignal)) / N;
    dt = 1/Fs;
    t = (0:dt:stopTime-dt)';  
    N=size(t,1);
    fSignal = fft(signal, n);
    freq = -Fs/2:(Fs/N):(Fs/2)-(Fs/N);
end