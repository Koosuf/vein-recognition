% addpath ../../common

outliers = 13;
threshes = [0:0.1:10];

colours = linspecer(length(history)+1);
leg_labels = {};
figure
set(0,'DefaultAxesColorOrder',colours)
hold all
count = 1;

for i = 1:length(history)
%     plot ((sum(history(i).frr_record) + sum(history(i).wrong_rec_record)) ./(600 - outliers).* 100, (sum(history(i).far_record))./600 .* 100, 'linewidth', 2); % Tested that this is equivalent to the other methods that I have used
    
    [correct_record, correct_neg_record] = tester(history(i).gen_distance, history(i).imp_distance, threshes);

    far = length(correct_neg_record) - sum(correct_neg_record);
    frr = length(correct_record) - sum(correct_record) - outliers;
        
    far = far ./ length(correct_neg_record) .* 100;
    frr = frr ./ (length(correct_record) - outliers) .* 100;
    
    plot (far, frr, 'linewidth', 2);
    leg_labels{count} = num2str(history(i).mhd_frac);
    count = count+1;
end

ylabel ('False acceptance rate')
xlabel ('False rejection rate');
x = [0:0.01:100];
plot(x,x, 'linestyle', '--', 'linewidth', 2);
leg_labels{count} = 'EER line';

legend(leg_labels);

% Legend title does not go into the box, so fuck it
% l = legend(leg_labels);
% ltitle = get(l,'title');
% set(ltitle,'string','Number of clusters');

for i = 1:length(history)
    
    % doing it twice is never a good idea'
    [correct_record, correct_neg_record] = tester(history(i).gen_distance, history(i).imp_distance, threshes);
    far = length(correct_neg_record) - sum(correct_neg_record);
    frr = length(correct_record) - sum(correct_record) - outliers;
        
    far = far ./ length(correct_neg_record) .* 100;
    frr = frr ./ (length(correct_record) - outliers) .* 100;
    
    scatter(far, frr, 'filled');  
end


goodplot();
% set(gca, 'XLim', [1 20]);
% set(gca, 'YLim', [4 22]);


% rmpath ../../common