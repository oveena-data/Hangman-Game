function mainGame()
    % Get the screen size
    screenSize = get(0, 'ScreenSize');

    % Calculate the position for the pop-up window to be in the middle
    windowSize = 500; % Square window size
    windowPosition = [screenSize(3)/2 - windowSize/2, screenSize(4)/2 - windowSize/2, windowSize, windowSize];

    % Create a figure for the pop-up window
    fig = figure('Name', 'Hangman Game', 'NumberTitle', 'off', 'Position', windowPosition);

    % Create an axes for displaying the background image
    ax = axes('Parent', fig, 'Units', 'normalized', 'Position', [0, 0, 1, 1]);

    % Load and display the background image (hangman.jpg)
    backgroundImage = imread('hangman.jpg');
    imshow(backgroundImage, 'Parent', ax);

    % Add a text box for user's name prompt with typing font effect
    namePrompt = uicontrol('Style', 'text', 'String', '', ...
        'Position', [windowSize/2 - 150, 200, 300, 30], 'BackgroundColor', [0, 0, 0], 'ForegroundColor', [1, 0.4, 0.8], ...
        'FontName', 'Courier New', 'FontSize', 14, 'HorizontalAlignment', 'center');

    % Add an editable text box for user's name input
    nameInput = uicontrol('Style', 'edit', 'Position', [windowSize/2 - 100, 170, 200, 25], ...
        'BackgroundColor', [0, 0, 0], 'ForegroundColor', [1, 1, 1], 'FontWeight', 'bold');

    % Add a text box to display welcome message with typing font effect (initially invisible)
    welcomeText = uicontrol('Style', 'text', 'String', '', ...
        'Position', [windowSize/2 - 150, 100, 300, 30], 'BackgroundColor', [0, 0, 0], 'ForegroundColor', [0, 1, 1], ...
        'FontName', 'Courier New', 'FontSize', 14, 'HorizontalAlignment', 'center', 'Visible', 'off');

    % Add a Play button (initially invisible)
    playButton = uicontrol('Style', 'pushbutton', 'String', 'READY TO PLAY!', ...
        'Position', [windowSize/2 - 100, 70, 200, 30], 'Callback', @startGame, 'Visible', 'off', ...
        'FontWeight', 'bold', 'ForegroundColor', [1, 1, 1], 'BackgroundColor', [0, 0, 0]);

    % Text for user's name prompt
    namePromptText = 'Enter your name to begin:';
    % Text for welcome message
    welcomeMessage = 'Welcome ';

    % Typing speed (characters per second)
    typingSpeed = 10;

    % Typing effect for name prompt
    for i = 1:numel(namePromptText)
        set(namePrompt, 'String', namePromptText(1:i));
        pause(1/typingSpeed);
    end

    % Callback function for the name input box
    function nameInputCallback(~, ~)
        % Check if the user has entered a name
        userName = get(nameInput, 'String');
        if ~isempty(userName)
            % Display the welcome message with typing effect
            for i = 1:numel(welcomeMessage)
                set(welcomeText, 'String', [welcomeMessage(1:i) userName '!'], 'Visible', 'on');
                pause(1/typingSpeed);
            end

            % Make the Play button visible
            set(playButton, 'Visible', 'on');
        end
    end

    % Set the callback function for the name input box
    set(nameInput, 'Callback', @nameInputCallback);

    % Callback function for the Play button
    function startGame(~, ~)
        % Close the pop-up window
        close(fig);

        % Call the function to start the hangman game
        playHangman();
    end
end
