
%%         TEAM MATES     :  Hassif Abdulahi Mustafa, Sayan Nandy, Faizan Mohamed, Pancho Krastev and Ahnaf Hassan
%%         PROJECT        :  Code for Real-time Audio Descrambler, Second Year Scenario
%%         DATE           :  10 - DEC - 2019
%% Setting up the analysis for the original messages  
clc
clear 
close all

[original,fs] = audioread('original.wav');
disp(fs)
k = length(original);

% Analysing original time domain
figure(1);
t = linspace(0, k/fs, k);
plot(t, original); 
title('Original Time Domain');

% Analysing original frequency domain
f = linspace(-fs/2, fs/2, k);
original_Y = fft(original,k);

figure(2)
plot(f,fftshift(abs(original_Y)));
title('Original Frequency Domain');


%% Setting up the analysis for the scrambled messages 
[scrambled,fs] = audioread('scrambled.wav');
k = length(scrambled);

% Analysing scrambled time domain
t = linspace(0, k/fs, k);
figure(3);
plot(t, scrambled);
title('Scrambled Time Domain');

% Analysing scrambled frequency domain
f = linspace(-fs/2,fs/2,k);
scrambled_Y = fft(scrambled,k);

figure(4);
plot(f,fftshift(abs(scrambled_Y))); 
ylim([0 2000])
title('Scrambled Frequency Domain');


% Bandstop analysis
  hb = BandstopF;
  bsy = filter(hb, scrambled);
  
% Unscrambling the frequencies by
% multiplying it with a carrier of 7kHz frequency
  f = linspace(-fs/2,fs/2,k);
  unscrambled = bsy.*(2*sin(2*pi*7000*t).');
  
  figure(5);
  plot(f, fftshift(abs(fft(unscrambled))));
 
% lowpass analysis (removing upper freq)
  hl = lowpassF;
  Unscrambled = filter(hl, unscrambled);

  figure(6);
  plot(f, fftshift(abs(fft(Unscrambled))));

%% Ploting and saving the figures as a PNG

 h =  findobj('type','figure');
 n = length(h);
 
 for k = 1:n
     figure(k);
     sname = ['fig',num2str(k),'.png'];
     saveas(gcf, sname);
     x_ = 10;
     y_ = 10;
     width = 400;
     height = 250;
     set(gcf,'units','points','position',[x_, y_, width, height]);
     grid on
     grid minor
 end

%% Playing sound of both original, scrambled and unscrambled 

sound(original, fs)
pause(5);
sound(scrambled, fs)
pause(5);
sound(Unscrambled, fs)



