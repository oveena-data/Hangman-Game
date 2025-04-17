% Stage 2: Hangman Game initialisation

% Prompt for difficulty level. Implement a function to read a word list
% from a file based on the level of difficulty. Implement a function to
% choose a random word from the word list. Implement a function to
% initialise variables such as guessed word, guessed letters, and incorrect
% guesses count. 

function playHangmanTesting() 
    % Define dialog box properties
    dlgTitle = 'Hangman Difficulty';
    dlgPrompt = 'How far can you go without dying? Choose your level of difficulty WISELY!';
    button1 = '<html><font color="#00FFFF"><b>EASY - I would not take a risk!</b></font></html>';
    button2 = '<html><font color="#F535AA"><b>DIFFICULT - I am a PRO, watch me win!</b></font></html>';
    
    % Prompt the user to select difficulty level using a customized dialog box
    choice = questdlg(dlgPrompt, dlgTitle, button1, button2, button1);

    % Check the user's choice
    switch choice
        case button1
            difficulty = 'easy';
        case button2
            difficulty = 'difficult';
    end

    % Define file names for word lists based on difficulty
    if strcmpi(difficulty, 'easy')
        filename = 'wordsSmall.txt'; % If difficulty is 'easy', choose words from 'wordsSmall.txt'
    elseif strcmpi(difficulty, 'difficult')
        filename = 'wordsHuge.txt'; % If difficulty is 'difficult', choose words from 'wordsHuge.txt'
    end
    
    % Read words from file 
    fileID = fopen(filename, 'r'); % Open the file for reading
    words = textscan(fileID, '%s'); % Read the words from the file
    fclose(fileID); % Close the file
    words = words{1}; % Extract the words from the cell array
    
    % Choose a random word
    wordIndex = randi(length(words)); % Generate a random index within the range of the words array
    word = upper(words{wordIndex}); % Select a word from the list and convert it to uppercase

    % Initialize variables
    guessedWord = repmat('_', 1, length(word)); % Create a string of underscores
    incorrectGuesses = 0; % Initialize the count of incorrect guesses
    maxIncorrectGuesses = 7; % Set the maximum number of incorrect guesses allowed
    guessedLetters = []; % Initialize an empty array to store guessed letters
end
