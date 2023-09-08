%% start anew statements %%
clc;
clearvars;
close all;


N_fft = 1024;
N_CP = 256;
TT = 100;
NumBits = 1024*TT;

constellation_QPSK = [1+1j,1-1j,-1+1j,-1-1j];

txBits = randi([0,1],NumBits,1)';
% data = randi([0 1],70,1);
% codedData = convenc(data,trellis);
tbdepth = 34;


snr_in_db =-20:2:30;

trellis = poly2trellis(3,[6 7]);

    for ii = 1:length(snr_in_db)

        snr = 10^(snr_in_db(ii)/10);

        %%repetition
        repTxBits =  convenc(txBits,trellis);

        %% modulation(COHERENT_BPSK) %%
        modSymbols  = myModulator(repTxBits,constellation_QPSK);
        modSymMatrix = reshape(modSymbols,N_fft,[]);


        % OFDM
        CP_idftSymMatrix = myOFDM(modSymMatrix,N_fft,N_CP);
        linear_cpidft = reshape(CP_idftSymMatrix,1,[]);
        % noise generation%%
        noise = 1/sqrt(2*snr)*(randn(1,length(linear_cpidft)) + 1i*randn(1,length(linear_cpidft)));

        rxModSymbols_cp = [];
        channel_Matrix = [];

        for ij = 1:length(linear_cpidft)/(N_CP+N_fft)
            channel_h = (randn(1,2)+1i*randn(1,2))*(1/sqrt(2));
            temp = conv(CP_idftSymMatrix(:,ij).',channel_h);
            rxModSymbols_cp = [rxModSymbols_cp,temp(1:end-1)];
            channel_Matrix = [channel_Matrix;channel_h];
        end

        rxModSymbols_cp = rxModSymbols_cp.';
        rxModSymbols_cp = reshape(rxModSymbols_cp,1,[]) + noise*sqrt(1/N_fft);


        %% DE - OFDM
        dftRxModSymMatrix = myDeOFDM(rxModSymbols_cp,N_fft,N_CP);
        dftRxLinear = reshape(dftRxModSymMatrix,1,[]);
        %DEMODULATION
        channel_time = fft(channel_Matrix.',N_fft);
        [demodulatedSymbols,demodulatedBits] = myDemodulator(dftRxLinear,constellation_QPSK);
        decodedBits = vitdec(demodulatedBits,trellis,tbdepth,'trunc','hard');

        % Pe COHERENT_BPSK calculation %%
        error = decodedBits - txBits;
        Pe(ii) = nnz(error)/length(error);
    end

semilogy(snr_in_db,Pe,color='r');

