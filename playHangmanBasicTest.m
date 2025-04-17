% Stage 0: Basic hangman game logic

% implement code that integrates all test codes in one. Making use if a
% sample list of words other than your easy and difficult word list.

function playHangmanBasicTest()
    % List of words
    words = {'MATLAB', 'PYTHON', 'JAVA', 'RUBY', 'CPLUSPLUS', 'JAVASCRIPT', 'HTML', 'CSS'}; % random use of a set of words
    
    % Choose a random word
    wordIndex = randi(length(words)); % Generate a random index within the range of the words array
    word = upper(words{wordIndex}); % Select a word from the list and convert it to uppercase

    % Initialize variables
    guessedWord = repmat('_', 1, length(word)); % Create a string of underscores to represent the letters of the word
    incorrectGuesses = 0; % Initialize the count of incorrect guesses
    maxIncorrectGuesses = 6; % Set the maximum number of incorrect guesses allowed
    guessedLetters = []; % Initialize an empty array to store guessed letters

    % Main loop
    while incorrectGuesses < maxIncorrectGuesses && any(guessedWord == '_')
        % Display current status
        disp(['Word: ' guessedWord]); % Display the current state of the word with guessed letters
        disp(['Guessed Letters: ' guessedLetters]); % Display the letters that have been guessed
        
        % Prompt user for guess
        guess = input('Guess a letter: ', 's'); % Prompt the user to enter a letter
        guess = upper(guess(1)); % Convert the guess to uppercase
        
        % Check if the guessed letter is valid
        if ~isletter(guess) || ismember(guess, guessedLetters) % Check if the guess is a letter and if it has already been guessed
            disp('You guessed this letter earlier. Try again.'); % Display an error message
            continue; % Skip the rest of the loop and start a new iteration
        end
        
        % Update guessed letters
        guessedLetters = [guessedLetters guess]; % Add the guessed letter to the array
        
        % Check if the guessed letter is in the word
        if ismember(guess, word) % Check if the guessed letter is in the word
            % Update guessed word
            guessedWord(word == guess) = guess; % Replace underscores with the guessed letter
            disp('Correct guess!'); % Display a message indicating a correct guess
        else
            % Increment incorrect guesses
            incorrectGuesses = incorrectGuesses + 1; % Increment the count of incorrect guesses
            disp('Incorrect guess.'); % Display a message indicating an incorrect guess
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
    end
end
