collect_random_pair=[];
theNumbers = randperm(10); % Whatever number you want.
for k = 1 : 2 : length(theNumbers)
	selection = theNumbers(k:k+1); % Report this selection to command window.
    collect_random_pair = [collect_random_pair; selection]
end