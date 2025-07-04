% CreateProductionDataFile.m

% Define the exact column names as expected by your app
expectedCols = {'ProductionID', 'LineID', 'LineName', 'Date', 'Shift', 'ProductType', 'QuantityProduced', 'EfficiencyPercentage'}; % <-- اینجا تغییر کرده

% Create a sample table with zero rows but correct column names and types
sampleProductionData = table(zeros(0,1), zeros(0,1), string.empty(0,1), datetime.empty(0,1), ...
                             zeros(0,1), string.empty(0,1), zeros(0,1), zeros(0,1), ...
                             'VariableNames', expectedCols);

% Add more comprehensive dummy data (with varied dates, shifts, lines, etc.)
sampleProductionData = [sampleProductionData;
    {1, 1, "Refrigerator Assembly", datetime('7/1/2025'), 1, "Refrigerator", 150, 92.00}; % ProductionID = 1
    {2, 1, "Refrigerator Assembly", datetime('7/1/2025'), 2, "Refrigerator", 145, 90.00}; % ProductionID = 2
    {3, 2, "Plastic Parts Production", datetime('7/1/2025'), 1, "Other Parts", 5000, 85.00}; % ProductionID = 3
    {4, 3, "Washing Machine Assembly", datetime('7/1/2025'), 1, "Washing Machine", 120, 95.00}; % ProductionID = 4
    {5, 4, "Refrigerator Quality Control", datetime('7/2/2025'), 1, "Refrigerator", 148, 98.50}; % ProductionID = 5
    {6, 2, "Plastic Parts Production", datetime('7/2/2025'), 2, "Other Parts", 4850, 84.50}; % ProductionID = 6
    {7, 3, "Washing Machine Assembly", datetime('7/3/2025'), 2, "Washing Machine", 118, 94.00}; % ProductionID = 7
    {8, 1, "Refrigerator Assembly", datetime('7/3/2025'), 3, "Refrigerator", 152, 91.50}; % ProductionID = 8
    {9, 5, "Washing Machine Quality Control", datetime('7/4/2025'), 1, "Washing Machine", 119, 97.00}; % ProductionID = 9
    {10, 6, "Electronic Parts Production", datetime('7/4/2025'), 2, "Other Parts", 2500, 96.00}; % ProductionID = 10
    {11, 7, "Packaging Line", datetime('7/4/2025'), 1, "Refrigerator", 150, 99.00}; % ProductionID = 11
    {12, 1, "Refrigerator Assembly", datetime('7/5/2025'), 1, "Refrigerator", 151, 92.50}; % ProductionID = 12
    {13, 2, "Plastic Parts Production", datetime('7/5/2025'), 1, "Other Parts", 5100, 86.00}; % ProductionID = 13
    {14, 3, "Washing Machine Assembly", datetime('7/6/2025'), 2, "Washing Machine", 121, 95.50}; % ProductionID = 14
    {15, 4, "Refrigerator Quality Control", datetime('7/6/2025'), 3, "Refrigerator", 149, 98.00}]; % ProductionID = 15

% Define the filename (make sure it's in the same directory as your .mlapp files)
filename = 'ProductionData.xlsx';

try
    % Write the table to the Excel file
    writetable(sampleProductionData, filename, 'WriteVariableNames', true, 'WriteMode', 'overwrite');
    disp(['Successfully created and populated: ' filename]);

    % Open the Excel file for visual inspection (Windows only)
    if ispc
        winopen(filename);
        disp(['Opened ' filename ' in Excel for inspection.']);
    else
        disp(['Please open ' filename ' manually to inspect its content and column names.']);
    end

catch ME
    disp(['Error creating or opening Excel file: ' ME.message]);
    disp('Please ensure Excel is installed and not currently editing the file.');
end

disp(' ');
disp('After inspecting the file, please close Excel and then run your AdminDashboard.mlapp.');