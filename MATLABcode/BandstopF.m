
function Hd = BandstopF
% BANDSTOP Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 10-Dec-2018 11:19:38

% Chebyshev Type II Bandstop filter designed using FDESIGN.BANDSTOP.

% All frequency values are in Hz.
Fs     = 44100;  % Sampling Frequency

N      = 10;      % Order
Fstop1 = 7900;   % First Stopband Frequency
Fstop2 = 8100;   % Second Stopband Frequency
Astop  = 100;     % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.bandstop('N,Fst1,Fst2,Ast', N, Fstop1, Fstop2, Astop, Fs);
Hd = design(h, 'cheby2');


% [EOF]
