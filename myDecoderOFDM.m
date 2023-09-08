function demodulatedBits = myDecoderOFDM(dftRxModSymMatrix,channel_time,constellation_QPSK,repetitions)

temm = (dftRxModSymMatrix.*conj(channel_time))./abs(channel_time);


rxModSymbols_1 = reshape(temm,1,[]);
demodulatedBits = [];
M = length(constellation_QPSK);
step = repetitions/log2(M);


for jj = 1:step:length(rxModSymbols_1)

    softRxSum = real(rxModSymbols_1(jj:jj+step-1))+imag(rxModSymbols_1(jj:jj+step-1)) ;
    if softRxSum > 0
        demodulatedBits = [demodulatedBits 0];
    else
        demodulatedBits = [demodulatedBits 1];
    end
end
