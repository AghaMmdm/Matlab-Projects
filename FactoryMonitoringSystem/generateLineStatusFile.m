% createManualLineStatusFile.m
% This script creates LineStatus.xlsx with sample data extracted manually from the provided image.
% It does NOT read from ProductionData.xlsx.

fprintf('Creating LineStatus.xlsx with data from your provided image...\n');

% --- 1. Define the data for LineStatus.xlsx based on image_654aa1.png ---
% Columns: LineID, LineName, Status, CurrentProduct, LastUpdateTime

% Manually extracted unique LineID and LineName from image_654aa1.png
lineIDs = [1; 2; 3; 4; 5; 6; 7];
lineNames = {
    "Refrigerator Assembly";
    "Plastic Parts Production";
    "Washing Machine Assembly";
    "Refrigerator Quality Control";
    "Washing Machine Quality Control";
    "Electronic Parts Production";
    "Packaging Line"
};

% Default status, current product, and last update time for each line
% You can modify these default values as needed.
currentTime = datetime('now'); % Current time for demonstration
statuses = {
    "Running";
    "Running";
    "Idle";
    "Maintenance";
    "Stopped";
    "Running";
    "Idle"
};
currentProducts = {
    "Refrigerator";
    "Other Parts";
    "None";
    "N/A";
    "Washing Machine";
    "Other Parts";
    "None"
};
updateTimes = [
    currentTime - minutes(10);
    currentTime - hours(1);
    currentTime - hours(2);
    currentTime - hours(4);
    currentTime - minutes(45);
    currentTime - hours(1.5);
    currentTime - hours(3)
];

% --- 2. Create the table ---
lineStatusTable = table(lineIDs, lineNames, statuses, currentProducts, updateTimes, ...
                        'VariableNames', {'LineID', 'LineName', 'Status', 'CurrentProduct', 'LastUpdateTime'});

% --- 3. Write to LineStatus.xlsx ---
lineStatusFile = 'LineStatus.xlsx';
try
    writetable(lineStatusTable, lineStatusFile, 'WriteMode', 'overwrite');
    fprintf('Successfully created %s with %d lines based on your image data.\n', lineStatusFile, height(lineStatusTable));
    fprintf('You can now proceed to run your LineStatusViewer.mlapp.\n');
catch ME
    fprintf(2, 'Error writing to %s: %s\n', lineStatusFile, ME.message);
    fprintf(2, 'Please ensure MATLAB has write permissions to the folder.\n');
end

fprintf('Manual LineStatus.xlsx creation complete.\n');