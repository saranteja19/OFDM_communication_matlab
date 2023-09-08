function dftRxModSymMatrix = myDeOFDM(rxModSymbols_cp,N_fft,N_CP)
rxModSymMatrix = reshape(rxModSymbols_cp,N_fft+N_CP,[]);
CPlessRxModSymMatrix = rxModSymMatrix(N_CP+1:end,:);
dftRxModSymMatrix = fft(CPlessRxModSymMatrix);
end