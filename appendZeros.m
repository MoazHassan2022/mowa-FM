function [ newSignal ] = appendZeros( signal, maxLength )
    newSignal = [signal; zeros(maxLength - length(signal), 1)];
end

