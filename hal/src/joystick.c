#include "../include/hal/joystick.h"
#include "../../app/include/audioGenerator.h"
#include "../../app/include/audioMixer.h"
#include "../../app/include/main.h"
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <pthread.h>

static pthread_t js_thread; 
static int adjust_volume = 5;
static int adjust_tempo = 5;

// Run a Linux command
void runCommand(char* command){
    // Execute the shell command (output into pipe)
    FILE *pipe = popen(command, "r");
    // Ignore output of the command; but consume it 
    // so we don't get an error when closing the pipe.
    char buffer[1024];
    while (!feof(pipe) && !ferror(pipe)) {
        if (fgets(buffer, sizeof(buffer), pipe) == NULL) {
            break;
            // printf("--> %s", buffer); // Uncomment for debugging
        }
    }
    // Get the exit code from the pipe; non-zero is an error:
    int exitCode = WEXITSTATUS(pclose(pipe));
    if (exitCode != 0) {
        perror("Unable to execute command:");
        printf(" command: %s\n", command);
        printf(" exit code: %d\n", exitCode);
    }
}

// Joytick Initialize (config pins)
static void joystickInit(void){
    runCommand("config-pin p8.14 gpio");
    runCommand("config-pin p8.15 gpio");
    runCommand("config-pin p8.16 gpio");
    runCommand("config-pin p8.18 gpio");
    runCommand("config-pin p8.17 gpio");
    runCommand("cd /sys/class/gpio/gpio26; echo in > direction");
    runCommand("cd /sys/class/gpio/gpio47; echo in > direction");
    runCommand("cd /sys/class/gpio/gpio46; echo in > direction");
    runCommand("cd /sys/class/gpio/gpio65; echo in > direction");
    runCommand("cd /sys/class/gpio/gpio27; echo in > direction");
}

// Read gpio value
static int gpioValue (char* gpio_add){
    FILE *pFile = fopen(gpio_add, "r");
    if (pFile == NULL) {
        printf("ERROR: Unable to open file (%s) for read\n", gpio_add);
        exit(1);
    }
    // Read string (line)
    const int MAX_LENGTH = 1024;
    char value[MAX_LENGTH];
    fgets(value, MAX_LENGTH, pFile);
    // Close
    fclose(pFile);
    return atoi(value);
}

// Read the joystick direction info by reading gpio value
static stickDirections readStickDirec (void){
    if (gpioValue(JSUP) == 0) {
        return Up;
    }else if (gpioValue(JSDN) == 0) {
        return Down;
    }else if (gpioValue(JSLFT) == 0) {
        return Left;
    }else if (gpioValue(JSRT) == 0) {
        return Right;
    } else if (gpioValue(JSPB) == 0){
        return Middle;
    }else {
        return NoDirection;
    }
}

static void* js_function(void* unused) {
    (void)unused;
    joystickInit();
    while (isRun()) {
        stickDirections dir = readStickDirec();
        if (dir == Middle) {
            set_mode_type(); 
            sleepForMs(500);
        }else if (dir == Up) {
            AudioMixer_setVolume(AudioMixer_getVolume() + adjust_volume);
            sleepForMs(500);
        }else if (dir == Down) {
            AudioMixer_setVolume(AudioMixer_getVolume() - adjust_volume);
            sleepForMs(500);
        }else if (dir == Left) {
            set_tempo(get_tempo() - adjust_tempo);
            sleepForMs(500);
        }else if (dir == Right) {
            set_tempo(get_tempo() + adjust_tempo);
            sleepForMs(500);
        }else {
            sleepForMs(100);
        }
    }
    return NULL;
}

// Createa a  camera thread
void Joystick_init(void) {
    int result_thread;
    result_thread = pthread_create(&js_thread, NULL, js_function, NULL);
    //check if the thread is created sucessfully
    if (result_thread != 0){
        // if thread cration fails, exit the program
        perror("Thread Creation Error!\n");
        exit(1);
    }
}

// Shut down the thread, and close the camera
void Joystick_cleanup(void) {
    pthread_join(js_thread, NULL);
}