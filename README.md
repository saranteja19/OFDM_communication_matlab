# OFDM_communication_matlab
**Project Title**: "Repetitive-Coded OFDM Communication System"

**Project Brief**:

**Objective**: Design and implement a communication system using Repetitive-Coded OFDM for robust data transmission.

**Description**:

This project focuses on creating a robust communication system that employs Repetitive-Coded Orthogonal Frequency Division Multiplexing (OFDM) for reliable data transmission. The system consists of eight main components:

1. **OFDM.m**:
   - Initializes simulation parameters, including FFT size, cyclic prefix length, and the total number of bits.
   - Implements QPSK modulation, repetition encoding (2 and 4 times), and OFDM modulation.
   - Adds simulated noise, applies channel modeling, and performs OFDM demodulation.
   - Calculates the Symbol Error Rate (Pe) for different SNR values.
   - Plots the Pe-SNR curves for both repetition factors.

2. **myRepEncoder.m**:
   - Defines a function to encode input bits using repetition coding based on the specified repetition factor.

3. **myOFDM.m**:
   - Contains a function for OFDM modulation, including IFFT, cyclic prefix insertion, and symbol matrix construction.

4. **myModulator.m**:
   - Defines the modulation function for mapping binary data to QPSK symbols.

5. **myDemodulator.m**:
   - Placeholder for potential demodulation functions.

6. **myDeOFDM.m**:
   - Contains a function for OFDM demodulation, including FFT and cyclic prefix removal.

7. **myDecoderOFDM.m**:
   - Defines a decoding function for demodulated OFDM symbols.
   - Calculates soft decisions and reconstructs demodulated bits using repetition-based majority voting.

**Key Actions**:

- **Design**: Created a communication system combining Repetitive Coding and OFDM.
- **Modulation**: Mapped binary data to QPSK symbols.
- **Encoding**: Repetition-encoded the data for redundancy.
- **OFDM Modulation**: Converted symbol streams into OFDM symbols with cyclic prefixes.
- **Channel Modeling**: Simulated channel effects with random complex gains.
- **Demodulation**: Applied FFT for OFDM demodulation.
- **Decoding**: Reconstructed demodulated bits using soft decisions and repetition decoding.
- **Evaluation**: Calculated the Symbol Error Rate (Pe) for various SNR levels.
- **Visualization**: Plotted Pe-SNR curves for 2 and 4 times repetition factors.

This project demonstrates the effectiveness of Repetitive-Coded OFDM for robust data communication in varying SNR conditions and repetition factors.
