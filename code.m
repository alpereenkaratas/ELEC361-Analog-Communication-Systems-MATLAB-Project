%%% a) x1(t) ve x2(t) isaretleri %%%
clc;
clear;
clear all;

Fs=50000;   % ornekleme frekansi
Ts=1/Fs;    % ornekleme periyodu
t=0:Ts:0.004-Ts; % cizdirme araligi

x1_t=10*cos(2*pi*1000*t)+20*sin(2*pi*2500*t); % x1(t) isaretinin tanimlanmasi
subplot(2,1,1)
plot(t,x1_t)
title('x_1(t)')
xlabel('t (sec)')
ylabel('gain')

x2_t=10*sin(2*pi*500*t)+20*cos(2*pi*2000*t); % x2(t) isaretinin tanimlanmasi
subplot(2,1,2)
plot(t,x2_t)
title('x_2(t)')
xlabel('t (sec)')
ylabel('gain')

%%% b) H1(f) ve H2(f) isaretleri %%%
clc;
clear;
clear all;

Fs=10000;   % ornekleme frekansi : fs>=2fm goz onune alinarak belirlendi
Ts=1/Fs;    % ornekleme periyodu
t=0:Ts:2-Ts;
f=-10000:9999; % cizdirme araligi

figure(2)
H1_f=rectangularPulse(f/4000); % H1(f) isareti tanimlamasi
subplot(2,1,1)
plot(f,H1_f)
title('H_1(f)')
xlabel('f (Hz)')
ylabel('gain')

H2_f=rectangularPulse(f/2000); % H2(f) isareti tanimlamasi
subplot(2,1,2)
plot(f,H2_f)
title('H_2(f)')
xlabel('f (Hz)')
ylabel('gain')

%%% a) X1(f) ve X2(f) isaretleri %%%
clc;
clear;
clear all;

Fs=10000;   % ornekleme frekansi
Ts=1/Fs;    % ornekleme periyodu
t=(-Fs:Fs-1)*(1/Fs); % cizdirme araligi

figure(3)
% x1(t) isaretinden X1(f) elde edebilmek icin Fourier Donusumu yapilir.
x1_t=10*cos(2*pi*1000*t)+20*sin(2*pi*2500*t); 
X1_f=abs(fftshift((1/length(x1_t))*fft(x1_t))); % X1(f) isaretinin tanimlanmasi
X1_f_phase=angle(fftshift((1/length(x1_t))*fft(x1_t)));
Fs_final=Fs.*t/2; % isaretlerin dogru frekans noktalarina yerlesmeleri icin
subplot(2,2,1)
plot(Fs_final,X1_f); % genligi bastirmak icin (X1(f))
title('|X_1(f)|')
xlabel('f (hz)')
ylabel('gain')

subplot(2,2,2)
plot(Fs_final,X1_f_phase); % fazi bastirmak icin (X1(f))
title('\angleX_1(f)')
xlabel('f (hz)')
ylabel('gain')

x2_t=10*sin(2*pi*500*t)+20*cos(2*pi*2000*t); 
X2_f=abs(fftshift((1/length(x2_t))*fft(x2_t))); % X2(f) isaretinin tanimlanmasi
X2_f_phase=angle(fftshift((1/length(x2_t))*fft(x2_t)));

subplot(2,2,3)
plot(Fs_final,X2_f)  % genligi bastirmak icin (X2(f))
title('|X_2(f)|')
xlabel('f (Hz)')
ylabel('gain')

subplot(2,2,4)
plot(Fs_final,X2_f_phase) % fazi bastirmak icin (X2(f))
title('\angleX_2(f)')
xlabel('f (Hz)')
ylabel('gain')

%%% c) Y1(f), Y2(f), y1(t) ve y2(t) isaretleri %%%
clc;
clear;
clear all;

Fs=10000;   % ornekleme frekansi
Ts=1/Fs;    % ornekleme periyodu
t=(-Fs:Fs-1)*(1/Fs); % cizdirme araligi

figure(4)
% X1(f) ve X2(f) isaretleri olusturuluyor

x1_t=10*cos(2*pi*1000*t)+20*sin(2*pi*2500*t); % X1(f) isaretinin tanimlanmasi
X1_f=(fftshift((1/length(x1_t))*fft(x1_t)));
X1_f_phase=angle(fftshift((1/length(x1_t))*fft(x1_t)));
Fs_final=Fs.*t/2; % isaretlerin dogru frekans noktalarina yerlesmeleri icin

x2_t=10*sin(2*pi*500*t)+20*cos(2*pi*2000*t); % X2(f) isaretinin tanimlanmasi
X2_f=(fftshift((1/length(x2_t))*fft(x2_t)));
X2_f_phase=angle(fftshift((1/length(x2_t))*fft(x2_t)));

Fs=10000;   % ornekleme frekansi : fs>=2fm goz onune alinarak belirlendi
Ts=1/Fs;    % ornekleme periyodu
t=0:Ts:2-Ts;
f=-10000:9999; % cizdirme araligi

% H1(f) ve H2(f) isaretleri olusturuluyor

H1_f=rectangularPulse(f/4000); % H1(f) isareti tanimlamasi

H2_f=rectangularPulse(f/2000); % H2(f) isareti tanimlamasi

% Y1(f) ve Y2(f) isaretleri
% Bu isaretleri olusturmak icin frekans uzayinda carpma yapiliyor.
% Frekans uzayinda carpma, transfer fonksiyonun giris sinyalini filtrelemesi ile oluyor. 

Y1_f=X1_f.*H1_f/Fs;
subplot(3,2,1)
plot(Fs_final,abs(Y1_f));   % genligi bastirmak icin (Y1(f))
title('Y_1(f)')
xlabel('f (hz)')
ylabel('gain')

Y1_f=X1_f.*H1_f/Fs;
subplot(3,2,2)
plot(Fs_final,angle(Y1_f)); % fazi bastirmak icin (Y1(f))
title('\angleY_1(f)')
xlabel('f (hz)')
ylabel('gain')

Y2_f=X2_f.*H2_f/Fs;
subplot(3,2,3)
plot(Fs_final,abs(Y2_f));  % genligi bastirmak icin (Y2(f))
title('Y_2(f)')
xlabel('f (hz)')
ylabel('gain')

Y2_f=X2_f.*H2_f/Fs;
subplot(3,2,4)
plot(Fs_final,angle(Y2_f));  % fazi bastirmak icin (Y2(f))
title('\angleY_2(f)')
xlabel('f (hz)')
ylabel('gain')

% y1(t) ve y2(t) isaretleri
%{
 Bu isaretleri elde edebilmek icin daha once frekans uzayinde elde edilen
 cikis isaretlerinin ifft ile ters fourier donusumu aliniyor.
%}

y1_t=ifft(ifftshift(Y1_f))*Fs;
subplot(3,2,5)
plot(t(1:100),y1_t(1:100));
title('y_1(t)')
xlabel('t (sec)')
ylabel('gain')

y2_t=ifft(ifftshift(Y2_f))*Fs;
subplot(3,2,6)
plot(t(1:100),y2_t(1:100));
title('y_2(t)')
xlabel('t (sec)')
ylabel('gain')

%%% d) y(t) ve Y(f) isaretleri %%%

% y1(t) ve y2(t) isaretleri carpilarak y(t) isareti elde ediliyor.
figure(5)
y_t=y1_t.*y2_t;
subplot(3,1,1);
plot(t(1:100),y_t(1:100));
title('y(t)');

% y(t) isaretinin Fourier Donusumu alinarak frekans uzayina geciliyor.
Y_f=(fftshift((1/length(y_t))*fft(y_t)));
subplot(3,1,2);
plot(Fs_final,abs(Y_f));
title('|Y(f)|');
xlabel('f (Hz)')
ylabel('gain')

subplot(3,1,3);
plot(Fs_final,angle(Y_f));
title('\angleY(f)');
xlabel('f (Hz)')
ylabel('gain')


