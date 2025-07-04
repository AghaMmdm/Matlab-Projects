% generateFaultsFile.m
% This script creates an empty Faults.xlsx file with the necessary headers.

fprintf('Generating empty Faults.xlsx file with datetime for Date...\n');

% Define the column names and their types.
% 'Date' will be defined as 'datetime' for consistency with other Excel files.
faultCols = {'FaultID', 'Date', 'FaultType', 'Description'};
faultTypes = {'double', 'datetime', 'string', 'string'}; % 'Date' is explicitly 'datetime' here.

% Create an empty table with the defined columns and types.
emptyFaultsTable = table('Size', [0, length(faultCols)], ...
                         'VariableNames', faultCols, ...
                         'VariableTypes', faultTypes);

% Define the filename
faultsFileName = 'Faults.xlsx';

% Write the empty table to the Excel file.
% We are relying on writetable to handle datetime correctly, as it did for other files.
try
    writetable(emptyFaultsTable, faultsFileName);
    fprintf('Successfully created empty %s with required headers.\n', faultsFileName);
    fprintf('This file is ready for ReportFaultForm.mlapp.\n');
catch ME
    fprintf(2, 'Error creating %s: %s\n', faultsFileName, ME.message);
    fprintf(2, 'Please ensure MATLAB has write permissions to the current folder.\n');
end

fprintf('Faults.xlsx generation complete.\n');