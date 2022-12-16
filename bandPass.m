function [ filtered ] = bandPass (signal, bandwidth, fc, fs)
    [b, a] = butter(3, [fc - bandwidth/2, fc + bandwidth/2]/(fs/2));
    filtered = filter(b, a, signal)*2;
end