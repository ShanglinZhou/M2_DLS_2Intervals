% Abosolute scaling index (ASI) for simulated responses to two intervals to
% replicate Supplemtalbe Figure S1B and S1C
clc
clear
close all

maxT1 = 3000;
maxT2 = 6000;

absTime = [0 500 1000 1500 2000 2500 3000];

%%
figure % figure S1B left
for i = 1:length(absTime)
    absEnd = absTime(i);
    absPeak = absEnd/2;
    
    x1_abs1 = linspace(0,1,floor(absPeak));
    x1_abs2 = linspace(1,0,floor(absPeak));
    x1_scale = linspace(0,1,floor(maxT1-absEnd));
    x1 = [x1_abs1 x1_abs2 x1_scale];
    
    x2_abs1 = linspace(0,1,floor(absPeak));
    x2_abs2 = linspace(1,0,floor(absPeak));
    x2_scale = linspace(0,1,floor(maxT2-absEnd));
    x2 = [x2_abs1 x2_abs2 x2_scale];
    
    ASI(i) = abscIndex(x1,x2);
    
    subplot(length(absTime),1,i)
    plot(x1,'Color',[0 0 1],'LineWidth',2);
    hold on
    plot(x2,'--','Color',[0 205/255 0],'LineWidth',2);
    title(['ASI: ' num2str(ASI(i))])
    xlabel('Time (ms)')
    ylabel('Activity')
    box off
end

%%% inverse of the above
figure  % figure S1B right
for i = 1:length(absTime)
    absEnd = absTime(i);
    absPeak = absEnd/2;
    
    x1_abs1 = linspace(0,1,floor(absPeak));
    x1_abs2 = linspace(1,0,floor(absPeak));
    x1_scale = linspace(0,1,floor(maxT1-absEnd));
    x1 = [x1_abs1 x1_abs2 x1_scale];
    x1 = 1 - x1;
    
    x2_abs1 = linspace(0,1,floor(absPeak));
    x2_abs2 = linspace(1,0,floor(absPeak));
    x2_scale = linspace(0,1,floor(maxT2-absEnd));
    x2 = [x2_abs1 x2_abs2 x2_scale];
    x2 = 1 - x2;
    
    ASI(i) = abscIndex(x1,x2);
    
    subplot(length(absTime),1,i)
    plot(x1,'Color',[0 0 1],'LineWidth',2);
    hold on
    plot(x2,'--','Color',[0 205/255 0],'LineWidth',2);
    title(['ASI: ' num2str(ASI(i))])
    xlabel('Time (ms)')
    ylabel('Activity')
    box off
end

%%  amplidutde effect
figure %% figure S1C left
amp = [0.5 1];
for i =  1:length(amp)
    absEnd = 1500;
    absPeak = absEnd/2;
    
    x1_abs1 = linspace(0,amp(i),floor(absPeak));
    x1_abs2 = linspace(amp(i),0,floor(absPeak));
    x1_scale = linspace(0,amp(setdiff([1 2],i)),floor(maxT1-absEnd));
    x1 = [x1_abs1 x1_abs2 x1_scale];
    
    x2_abs1 = linspace(0,amp(i),floor(absPeak));
    x2_abs2 = linspace(amp(i),0,floor(absPeak));
    x2_scale = linspace(0,amp(setdiff([1 2],i)),floor(maxT2-absEnd));
    x2 = [x2_abs1 x2_abs2 x2_scale];
    
    ASI(i) = abscIndex(x1,x2);
    
    subplot(2,1,i)
    plot(x1,'Color',[0 0 1],'LineWidth',2);
    hold on
    plot(x2,'--','Color',[0 205/255 0],'LineWidth',2);
    title(['ASI: ' num2str(ASI(i))])
    xlabel('Time (ms)')
    ylabel('Activity')
    box off
end

%%% inverse the above
figure %% figure S1C right

for i =  1:length(amp)
    absEnd = 1500;
    absPeak = absEnd/2;
    
    x1_abs1 = linspace(0,amp(i),floor(absPeak));
    x1_abs2 = linspace(amp(i),0,floor(absPeak));
    x1_scale = linspace(0,amp(setdiff([1 2],i)),floor(maxT1-absEnd));
    x1 = [x1_abs1 x1_abs2 x1_scale];
    x1 = 1 - x1;
    
    x2_abs1 = linspace(0,amp(i),floor(absPeak));
    x2_abs2 = linspace(amp(i),0,floor(absPeak));
    x2_scale = linspace(0,amp(setdiff([1 2],i)),floor(maxT2-absEnd));
    x2 = [x2_abs1 x2_abs2 x2_scale];
    x2 = 1- x2;
    
    ASI(i) = abscIndex(x1,x2);
    
    subplot(2,1,i)
    plot(x1,'Color',[0 0 1],'LineWidth',2);
    hold on
    plot(x2,'--','Color',[0 205/255 0],'LineWidth',2);
    title(['ASI: ' num2str(ASI(i))])
    xlabel('Time (ms)')
    ylabel('Activity')
    box off
end

