function plotSignal(mt, t, mf, f)
  figure;
  % plot signal in time
  subplot(3, 1, 1), plot(t, mt),
  xlabel('Time (sec)'); ylabel('Amplitude');
  title('Signal in time domain');

  % plot fft magnitude
  subplot(3, 1, 2), plot(f, abs(mf)),
  xlabel('Frequency (Hz)'), ylabel('Magnitude'),
  title('Spectrum, magnitude');

  % plot fft phase
  subplot(3, 1, 3), plot(f, unwrap(angle(mf))),
  xlabel('Frequency (Hz)'); ylabel('Phase');
  title('Spectrum, unwrapped phase');
end