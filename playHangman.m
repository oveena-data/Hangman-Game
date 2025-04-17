function playHangman() 
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

    % Main loop
    while incorrectGuesses < maxIncorrectGuesses && any(guessedWord == '_')
        % Display current status
        disp(['Word: ' guessedWord]); % Display the current state of the word with guessed letters
        disp(['Guessed Letters: ' guessedLetters]); % Display the letters that have been guessed
        disp(['Spaces to fill: ' num2str(sum(guessedWord == '_'))]); % Display the number of blank spaces left
        
        % Prompt user for guess
        guess = input('Guess a letter: ', 's'); % Prompt the user to enter a letter
        guess = upper(guess(1)); % Convert the guess to uppercase
        
        % Check if the guessed letter is valid
        if ~isletter(guess) || ismember(guess, guessedLetters) % Check if the guess is a letter and if it has already been guessed
            disp('Invalid guess. Try again.'); % Display an error message
            continue; % Skip the rest of the loop and start a new iteration
        end
        
        % Update guessed letters
        guessedLetters = [guessedLetters guess]; % Add the guessed letter to the array
        
        % Check if the guessed letter is in the word
        if ismember(guess, word) % Check if the guessed letter is in the word
            % Update guessed word
            indices = word == guess;
            guessedWord(indices) = guess; % Replace underscores with the guessed letter
            disp('Correct guess. Hurray!!!'); % Display a message indicating a correct guess
        else
            % Increment incorrect guesses
            incorrectGuesses = incorrectGuesses + 1; % Increment the count of incorrect guesses
            disp(['Incorrect guess. Number of lives left: ', num2str(maxIncorrectGuesses - incorrectGuesses)]); % Display a message indicating an incorrect guess and the remaining lives
        end
        
        % Display hangman
        drawHangman(incorrectGuesses); % Call the function to draw the hangman based on the number of incorrect guesses
    end
    
    % Display result
    if incorrectGuesses >= maxIncorrectGuesses % Check if the maximum number of incorrect guesses has been reached
        disp('You lost! The word was:'); % Display a message indicating the player lost
    else
        disp('Congratulations! You guessed the word:'); % Display a message indicating the player won
    end
    disp(word); % Display the correct word
end

function drawHangman(incorrectGuesses)
    % Draw hangman based on number of incorrect guesses
    switch incorrectGuesses
        case 0
            disp('_________');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 1
            disp('_________');
            disp('|     |  ');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 2
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|        ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 3
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|     |  ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 4
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|    /|  ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 5
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|    /|\ ');
            disp('|        ');
            disp('|        ');
            disp('|_________');
        case 6
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|    /|\ ');
            disp('|    /   ');
            disp('|        ');
            disp('|_________');
        case 7
            disp('_________');
            disp('|     |  ');
            disp('|     O  ');
            disp('|    /|\ ');
            disp('|    / \ ');
            disp('|        ');
            disp('|_________'); 
    end
end
