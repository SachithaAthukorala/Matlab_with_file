% a) Read the temperature data from the CSV file
data = readtable('mat.csv');

% b) Calculate the average temperature for each city across all months
avg_temp = mean(data{:, 2:end}, 2);

% c) Determine the cities with the highest and lowest average temperatures
[max_temp, max_idx] = max(avg_temp);
[min_temp, min_idx] = min(avg_temp);
cities = data.cityName;
city_with_highest_temp = cities{max_idx};
city_with_lowest_temp = cities{min_idx};

fprintf('City with highest average temperature: %s\n', city_with_highest_temp);
fprintf('City with lowest average temperature: %s\n', city_with_lowest_temp);

% d) Assign a rating to each city based on its average temperature
ratings = cell(size(avg_temp));
ratings(avg_temp > 30) = {'Rating A'};
ratings(avg_temp <= 30 & avg_temp > 25) = {'Rating B'};
ratings(avg_temp <= 25 & avg_temp > 20) = {'Rating C'};
ratings(avg_temp <= 20) = {'Rating D'};

% Display the results
disp('City Ratings:');
for i = 1:numel(cities)
    fprintf('%s: %s\n', cities{i}, ratings{i});
end
