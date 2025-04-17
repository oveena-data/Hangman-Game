% Stage 4: hangman Drawing in ASCII art

% a function to be implemented to draw the hangman based on the number of
% incorrect guesses. 

function drawHangmanTesting(incorrectGuesses)
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
