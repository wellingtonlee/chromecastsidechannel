% Data files
database_files = {'data/database/database_image_short_100ms.csv', 'data/database/database_image_long_100ms.csv', 'data/database/database_moving_short_100ms.csv', 'data/database/database_moving_long_100ms.csv'};
testset1_files = {'data/testset1/testset1_image_short_100ms.csv', 'data/testset1/testset1_image_long_100ms.csv', 'data/testset1/testset1_moving_short_100ms.csv', 'data/testset1/testset1_moving_long_100ms.csv'};
testset2_files = {'data/testset2/testset2_image_short_100ms.csv', 'data/testset2/testset2_image_long_100ms.csv', 'data/testset2/testset2_moving_short_100ms.csv', 'data/testset2/testset2_moving_long_100ms.csv'};

% Parse data
database = parse_many(database_files, 0.1);
testset1 = parse_many(testset1_files, 0.1);
testset2 = parse_many(testset2_files, 0.1);

% Normalize
database = norm_filt(database);
testset1 = norm_filt(testset1);
testset2 = norm_filt(testset2);

% Uncomment below to plot the data
%plot_data(testset1, 4, 4);
%plot_data(testset2, 4, 4);

% Perform linear and fft correlations
[lin_corrs, fft_corrs] = correlate(testset1, database);

% Run the correlations through our model
model = model_stats(lin_corrs, fft_corrs);