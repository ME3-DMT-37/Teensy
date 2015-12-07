% Teensy by Rory Cahill on 26/11/2015 updated 02/12/2015

classdef Teensy
    
    properties
        name; % serial port name
        baud; % serial port baud rate
        port; % serial port object
        auto; % serial automatic connect / disconnect mode
    end
    
    methods
        
        % TEENSY CONSTRUCTOR FUNCTION
        function t = Teensy(name, baud, auto)
            
            % Teensy constructor used to initiate a Teensy object
            
            % if more than zero arguments is supplied, set serial port
            if(nargin > 0)
                t.name = name;
            end
            
            % if more than one arguments are supplied, set baud rate
            if (nargin > 1)
                t.baud = baud;
            end
            
            % if more than two arguments are supplied, set automatic
            % connect / disconnect mode (and enable by default)
            if (nargin > 2)
                t.auto = auto;
            else
                t.auto = true;
            end
            
        end
        
        % CONNECT TEENSY FUNCTION
        function t = connectTeensy(t)
            
            % connectTeensy opens a serial connection with the Teensy
            
            % create a serial port
            t.port = serial(t.name, 'BaudRate', t.baud);
            
            % open the serial port
            fopen(t.port);
            
        end
        
        % DISCONNECT TEENSY FUNCTION
        function t = disconnectTeensy(t)
            
            % disconnectTeensy closes a serial connection with the Teensy

            % close the serial port
            fclose(t.port);
            
        end
        
        % COMMAND TEENSY FUNCTION
        function commandTeensy(t, command, value)
            
            % commandTeensy sends commands to the Teensy
            
            % if all three arguments are supplied, the command is a
            % character (array) variable, and the value is a numerical
            % variable
            if(nargin == 3 && ischar(command) && isnumeric(value))
                
                % connect to the Teensy
                if(t.auto); t = connectTeensy(t); end
                
                % convert the value to a string
                value = num2str(value);
                
                % combine command character with value
                if(strcmp(command, 'angle')); buffer = strcat('a', value); end
                if(strcmp(command, 'speed')); buffer = strcat('s', value); end
                if(strcmp(command, 'direction')); buffer = strcat('d', value); end
                if(strcmp(command, 'continuous')); buffer = strcat('c', value); end
                if(strcmp(command, 'rotate')); buffer = strcat('r', value); end
                
                % send command over serial port
                fprintf(t.port, buffer);
               
                % disconnect from the Teensy
                if(t.auto); disconnectTeensy(t); end
                
            end
            
        end
        
    end
    
end
