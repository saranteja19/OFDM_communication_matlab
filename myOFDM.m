function  CP_idftSymMatrix = myOFDM(modSymMatrix,N_fft,N_CP)
idftSymMatrix = ifft(modSymMatrix);
cyclicPrefixMatrix = idftSymMatrix(N_fft-N_CP+1:N_fft,:);
CP_idftSymMatrix = [cyclicPrefixMatrix;idftSymMatrix];
end
