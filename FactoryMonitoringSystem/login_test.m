% Step 1: Read the Users.xlsx file
% Make sure 'Users.xlsx' is in your current MATLAB folder, or provide the full path.
try
    userData = readtable('Users.xlsx');
    disp('Users data loaded successfully.');
catch ME
    disp(['Error loading Users.xlsx: ' ME.message]);
    disp('Please make sure Users.xlsx is in the correct directory and is not open in Excel.');
    return; % Exit if file cannot be loaded
end

% Step 2: Implement a simple login logic (for testing purposes)
disp(userData.Username)
disp(userData.Password)
% Prompt for username and password
inputUsername = input('Enter Username: ', 's'); % 's' makes it read as string
inputPassword = input('Enter Password: ', 's');

% Check if the entered credentials match any user in the table
% We need to find the row where both username and password match.
% Using 'ismember' or direct comparison within the table

% Find matching username
usernameMatch = strcmp(userData.Username, inputUsername);

% Find matching password
passwordMatch = strcmp(userData.Password, inputPassword);

% Find the row where both username and password match
loggedInUserRow = find(usernameMatch & passwordMatch);

if ~isempty(loggedInUserRow)
    % User found, get their role
    userRole = userData.Role{loggedInUserRow}; % Access cell array elements with {}
    disp(['Login successful! Welcome, ' inputUsername '. Your role is: ' userRole]);

    % Here you would branch based on the user's role
    if strcmp(userRole, 'مدیر')
        disp('Redirecting to Admin Dashboard...');
        % Call admin dashboard function or open admin GUI
    elseif strcmp(userRole, 'اپراتور')
        disp('Redirecting to Operator Dashboard...');
        % Call operator dashboard function or open operator GUI
    end
else
    disp('Login failed. Invalid username or password.');
end