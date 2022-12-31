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

% Fc2 is the same as Fc3

% Synchronous demodulation

[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

sound(demodulatedTime2, Fs2);

% Comment:
% Sound of each signal with very clear but weak because it is divided by 2,
% So, we needed to multiply it by 2, every single signal was very clear



% Demodulation with 10 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 10, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 10, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 10, 0);

[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);


% Comment:
% Sound of signal modulated with DSB was very clear, but in next two
% signals modulated with QAM, the phase shift resulted in interference 
% between them


% Demodulation with 30 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 30, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 30, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 30, 0);


[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);



% Comment:
% Sound of signal modulated with DSB was weak, but in next two
% signals modulated with QAM, the phase shift resulted in much interference 
% between them



% Demodulation with 90 degrees as phase shift

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 90, 0);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 90, 0);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 90, 0);


[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Comment:
% There is no sound of signal modulated with DSB because cos(90) = 0, so, the signal modulated was 0, 
% but in next two signals modulated with QAM, the phase shift of 90 resulted in exchanging
% between them, because cos(90) = 0, sin(0) = 0


% Demodulation with local carrier different by 2 Hz from carrier frequency

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 0, 2);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 0, 2);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 0, 2);

[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);


% Comment:
% For all three signals, some moments were removed, because the sampling
% frequency is decremented by 2 HZ, then the sampling rate goes down which
% leads to removal of some moments, and small interference between last two
% signals because of difference of carrier frequency that is used for
% carrier generation

% Demodulation with local carrier different by 10 Hz from carrier frequency

[Fc1, ct1] = generateCarrier(Fs1, t1, 1, 5, 0, 10);
[Fc2, ct2] = generateCarrier(Fs2, t2, 1, 2.5, 0, 10);
[Fc3, ct3] = generateCarrier(Fs3, t3, 0, 2.5, 0, 10);

[demodulatedTime1, demodulatedFreq1] = demodulation(signalSummationTime, ct1, 7000, Fs1);
[demodulatedTime2, demodulatedFreq2] = demodulation(signalSummationTime, ct2, 6000, Fs2);
[demodulatedTime3, demodulatedFreq3] = demodulation(signalSummationTime, ct3, 6000, Fs3);

plotSignal(demodulatedTime1, t1, demodulatedFreq1, freq1);
plotSignal(demodulatedTime2, t2, demodulatedFreq2, freq2);
plotSignal(demodulatedTime3, t3, demodulatedFreq3, freq3);

% Comment:
% For all three signals, some more moments were removed, because the sampling
% frequency is decremented by 10 HZ, then the sampling rate goes down which
% leads to removal of some moments, and small interference between last two
% signals because of difference of carrier frequency that is used for
% carrier generation