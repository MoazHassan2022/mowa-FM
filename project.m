[signal1, t1, fSignal1, freq1, Fs1] = readSignal('projectInput1.wav');
[signal2, t2, fSignal2, freq2, Fs2] = readSignal('projectInput2.wav');
[signal3, t3, fSignal3, freq3, Fs3] = readSignal('projectInput3.wav');

plotSignal(signal1, t1, fSignal1, freq1);
plotSignal(signal2, t2, fSignal2, freq2);
plotSignal(signal3, t3, fSignal3, freq3);

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 0, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 0, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 0, 0);

[modulatedTime1, modulatedFreq1] = modulation(signal1, ct1);
[modulatedTime2, modulatedFreq2] = modulation(signal2, ct2);
[modulatedTime3, modulatedFreq3] = modulation(signal3, ct3);

plotSignal(modulatedTime1, t1, modulatedFreq1, freq1);
plotSignal(modulatedTime2, t2, modulatedFreq2, freq2);
plotSignal(modulatedTime3, t3, modulatedFreq3, freq3);

signalSummationTime = modulatedTime1 + modulatedTime2 + modulatedTime3;
signalSummationFreq = fftshift(fft(signalSummationTime));

plotSignal(signalSummationTime, t1, signalSummationFreq, freq1);

% Demodulation

%bandwidth1 = 1 * 10 ** 4 => 1.7 * 10 ** 4
%bandwidth2 = 2.2 * 10 ** 4 => 2.67 * 10 ** 4

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

% Synchronous demodulation

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Demodulation with 10 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 10, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 10, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 10, 0);

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Demodulation with 30 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 30, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 30, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 30, 0);

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);


% Demodulation with 90 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 90, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 90, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 90, 0);

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Demodulation with local carrier different by 2 Hz from carrier frequency

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 90, 2);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 90, 2);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 90, 2);

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Demodulation with local carrier different by 10 Hz from carrier frequency

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 90, 10);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 90, 10);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 90, 10);

receivedSignal1 = bandPass(signalSummationTime, 7000, Fc1, Fs1); % This is the first signal
receivedSignal2 = bandPass(signalSummationTime, 6000, Fc2, Fs2); % This is the second two signals, Fc2 is the same as Fc3

[demodulatedTime1, demodulatedFreq1] = demodulation(receivedSignal1, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(receivedSignal2, ct2, 1500, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(receivedSignal2, ct3, 1500, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

%sound(demodulatedTime2, Fs2);