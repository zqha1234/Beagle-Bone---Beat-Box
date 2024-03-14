#include "main.h"
#include "../../hal/include/hal/accelerometer.h"
#include "../../hal/include/hal/joystick.h"
#include "../../hal/include/hal/udp.h"
#include "../include/audioGenerator.h"
#include "../include/audioMixer.h"
#include "../include/output.h"
#include "../include/periodTimer.h"
#include <stdio.h>
#include <stdbool.h>

static bool flag = true;

// terminate the program
void Program_terminate(void) {
    flag = false;
}

// return the bool value if the program should continue to run
bool isRun(void) {
    return flag;
}

// wait for shutdown, and clean up the threads;
static void wait_for_shutdown(void){
    UDP_cleanup();
    audio_gen_cleanup();
    Joystick_cleanup();
    Accelerometer_cleanup();
    output_cleanup();
    AudioMixer_cleanup();
    Period_cleanup();
}

int main(void) {
    UDP_init();
    Period_init();
    AudioMixer_init();
    audio_gen_init();
    Joystick_init();
    Accelerometer_init();
    output_init();
    wait_for_shutdown();
    return 0;
}