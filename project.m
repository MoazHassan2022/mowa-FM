[signal1, t1, fSignal1, freq1, Fs1] = readSignal('projectInput1.wav');
[signal2, t2, fSignal2, freq2, Fs2] = readSignal('projectInput2.wav');
[signal3, t3, fSignal3, freq3, Fs3] = readSignal('projectInput3.wav');

plotSignal(signal1, t1, fSignal1, freq1);
plotSignal(signal2, t2, fSignal2, freq2);
plotSignal(signal3, t3, fSignal3, freq3);

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 4);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.1);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.1);

[modulatedTime1, modulatedFreq1] = modulation(signal1, ct1);
[modulatedTime2, modulatedFreq2] = modulation(signal2, ct2);
[modulatedTime3, modulatedFreq3] = modulation(signal3, ct3);

plotSignal(modulatedTime1, t1, modulatedFreq1, freq1);
plotSignal(modulatedTime2, t2, modulatedFreq2, freq2);
plotSignal(modulatedTime3, t3, modulatedFreq3, freq3);

signalSummationTime = modulatedTime1 + modulatedTime2 + modulatedTime3;
signalSummationFreq = fftshift(fft(signalSummation));

plotSignal(signalSummationTime, t1, signalSummationFreq, freq1);
