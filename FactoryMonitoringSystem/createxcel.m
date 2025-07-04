% CreateUsersFile.m

% Define the expected column names
expectedCols = {'UserID', 'Username', 'Role', 'Password', 'Name'};

% Create a sample table with zero rows but correct column names and types
% UserID as double (numeric), others as string
sampleUsers = table(zeros(0,1), string.empty(0,1), string.empty(0,1), ...
                    string.empty(0,1), string.empty(0,1), ...
                    'VariableNames', expectedCols);

% Add a couple of dummy users for testing
sampleUsers = [sampleUsers; {1, "admin_user", "Admin", "admin123", "Admin Name"}];
sampleUsers = [sampleUsers; {2, "operator_user", "Operator", "op456", "Operator Name"}];

% Define the filename (make sure it's in the same directory as your .mlapp file or specify full path)
filename = 'Users.xlsx';

try
    % Write the table to the Excel file
    % 'WriteVariableNames', true ensures that the column headers are written
    % 'WriteMode', 'overwrite' ensures it replaces any existing file
    writetable(sampleUsers, filename, 'WriteVariableNames', true, 'WriteMode', 'overwrite');
    disp(['Successfully created and populated: ' filename]);

    % Open the Excel file (Windows specific, for visual check)
    % On Mac/Linux, you might just get a message to open it manually, or use 'open(filename)'
    if ispc % Check if the operating system is Windows
        winopen(filename);
        disp(['Opened ' filename ' in Excel for inspection.']);
    else
        disp(['Please open ' filename ' manually to inspect its content and column names.']);
    end

catch ME
    disp(['Error creating or opening Excel file: ' ME.message]);
    disp('Please ensure Excel is installed and not currently editing the file.');
end

disp(' '); % Just a blank line for readability
disp('After inspecting the file, please close Excel and then run your UserManagementApp.');