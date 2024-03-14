#ifndef MY_JOYSTICK_H
#define MY_JOYSTICK_H

// the joystick.c program will create a thread to receive the input from the joystick and 
// according to the input, beat-box will increase / decrease the volume and temp. also, it 
// can change the mode of the beat-box is playing

// define the gpio pins
#define JSUP "/sys/class/gpio/gpio26/value"
#define JSRT "/sys/class/gpio/gpio47/value"
#define JSDN "/sys/class/gpio/gpio46/value"
#define JSLFT "/sys/class/gpio/gpio65/value"
#define JSPB "/sys/class/gpio/gpio27/value"

// define the stick directions
typedef enum { 
    Up, 
    Down, 
    Left, 
    Right, 
    Middle,
    NoDirection 
} stickDirections;


// void joystickInit(void);
// int gpioValue (char* gpio_add);
// stickDirections readStickDirec (void);

void runCommand(char* command);
// create the thread
void Joystick_init(void);
// clean up the thread
void Joystick_cleanup(void);

#endif