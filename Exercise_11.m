%% Exercise 11 – FIR Filter Types (Type I–IV)
% Author: [Your Name]
% Date: [Date]
% Description: Plots magnitude, phase, and zero diagrams for four FIR filter types.

clear; close all; clc;

% --- Impulse responses for each FIR type ---
h1 = [1 2 3 4 4 3 2 1];      % Type I (M even, symmetric)
h2 = [1 2 3 4 3 2 1];        % Type II (M odd, symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1];  % Type III (M even, antisymmetric)
h4 = [-1 -2 -3 0 3 2 1];     % Type IV (M odd, antisymmetric)

filters = {h1, h2, h3, h4};
titles = {'FIR Type I', 'FIR Type II', 'FIR Type III', 'FIR Type IV'};

figure('Name','Exercise 11 – FIR Filter Types','NumberTitle','off');

for i = 1:4
    h = filters{i};
    [H, w] = freqz(h, 1, 512);

    % --- Magnitude ---
    subplot(4, 3, (i-1)*3 + 1);
    plot(w/pi, abs(H), 'LineWidth', 1.5);
    grid on; title([titles{i} ' - Magnitude']);
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('|H(e^{j\omega})|');

    % --- Phase ---
    subplot(4, 3, (i-1)*3 + 2);
    plot(w/pi, unwrap(angle(H)), 'LineWidth', 1.5);
    grid on; title('Phase Response');
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('Phase (radians)');

    % --- Zero Plot ---
    subplot(4, 3, (i-1)*3 + 3);
    zplane(h,1);
    title('Zero Plot');
end

sgtitle('Exercise 11 – FIR Filter Types (Magnitude, Phase, Zero Plot)');

% Optional: Save figures
if ~exist('results','dir')
    mkdir('results');
end

for i = 1:4
    fig = figure('Visible','off');
    h = filters{i};
    [H, w] = freqz(h, 1, 512);

    subplot(1,3,1); plot(w/pi, abs(H)); grid on; title('Magnitude');
    subplot(1,3,2); plot(w/pi, unwrap(angle(H))); grid on; title('Phase');
    subplot(1,3,3); zplane(h,1); title('Zero Plot');

    sgtitle(titles{i});
    saveas(fig, fullfile('results', ['fir_type' num2str(i) '.png']));
    close(fig);
end
