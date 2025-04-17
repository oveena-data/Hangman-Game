% Stage 3: Game Loop

% Display current status of teh game (guessed word, guessed letters,
% remaining lives). Implement code to prompt the user to guess a letter.
% Check guess validity for letters. Code to update the guessed letters
% array with the new guess. Update the guessed word with the correct
% guesses. Handle incorrect guesses by incrementing the count and
% displayong hangman. Implement code to check if the game has ended (either
% all letters or guessed or maximum incorrect guesses reached).Implement a
% code to display the game result (win or lose) and the correct word. 

function playHangmanGameLoopTesting() 
    % (Previous code from Stage 2)

    % Main loop
    while incorrectGuesses < maxIncorrectGuesses && any(guessedWord == '_')
        % Display current status
        disp(['Word: ' guessedWord]); % Display the current state of the word with guessed letters
        disp(['Guessed Letters: ' guessedLetters]); % Display the letters that have been guessed
        disp(['Blank Spaces left in your word: ' num2str(sum(guessedWord == '_'))]); % Display the number of blank spaces left
        
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
