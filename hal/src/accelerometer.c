#include <pthread.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "../include/hal/joystick.h"
#include "../include/hal/accelerometer.h"
#include "../../app/include/audioGenerator.h"
#include "../../app/include/main.h"
#include "../../app/include/periodTimer.h"

static pthread_t acc_thread; 
static int i2cFileDesc;
static int16_t x;
static int16_t y;
static int16_t z;
static double xy_threshold = 0.6;
static double z_threshold = 1.5;
static unsigned char xl = OUT_X_L;
static unsigned char xh = OUT_X_H;
static unsigned char yl = OUT_Y_L;
static unsigned char yh = OUT_Y_H;
static unsigned char zl = OUT_Z_L;
static unsigned char zh = OUT_Z_H;
static double one_g = 16384.0;

// Initialize the I2C device
static int initI2cBus(char* bus, int address) { 
    int i2cFileDesc = open(bus, O_RDWR);
    int result = ioctl(i2cFileDesc, I2C_SLAVE, address);
    if (result < 0) {
        perror("I2C: Unable to set I2C device to slave address.");
        exit(1);
    }
    return i2cFileDesc;
}

// Write an I2C device's register
static void writeI2cReg(int i2cFileDesc, unsigned char regAddr, unsigned char value) {
    unsigned char buff[2];
    buff[0] = regAddr;
    buff[1] = value;
    int res = write(i2cFileDesc, buff, 2);
    if (res != 2) {
        perror("I2C: Unable to write i2c register.");
        exit(1);
    }
}


// Read from I2C device's registers
static unsigned char* readI2cReg(int i2cFileDesc, unsigned char regAddr) {
    // To read a register, must first write the address
    int res = write(i2cFileDesc, &regAddr, sizeof(regAddr));
    if (res != sizeof(regAddr)) {
        perror("I2C: Unable to write to i2c register.");
        exit(1);
    }
    unsigned char *buff = malloc(sizeof(char)*6);
    write(i2cFileDesc, &xl, 1);
    char data[1] = {0};
    read(i2cFileDesc, data, 1);
    buff[0] = data[0];
    write(i2cFileDesc, &xh, 1);
    read(i2cFileDesc, data, 1);
    buff[1] = data[0];
    write(i2cFileDesc, &yl, 1);
    read(i2cFileDesc, data, 1);
    buff[2] = data[0];
    write(i2cFileDesc, &yh, 1);
    read(i2cFileDesc, data, 1);
    buff[3] = data[0];
    write(i2cFileDesc, &zl, 1);
    read(i2cFileDesc, data, 1);
    buff[4] = data[0];
    write(i2cFileDesc, &zh, 1);
    read(i2cFileDesc, data, 1);
    buff[5] = data[0];
    return buff;
}

// initialize the accelometer
static void accInit(void) {
    runCommand("config-pin P9_18 i2c");
    runCommand("config-pin P9_17 i2c");
    i2cFileDesc = initI2cBus(I2CDRV_LINUX_BUS1, I2C_DEVICE_ADDRESS);
    writeI2cReg(i2cFileDesc, CTRL_REG1, 0x27);
    writeI2cReg(i2cFileDesc, CTRL_REG4, 0x00);
}

static void* acc_function(void* unused) {
    (void)unused;
    accInit();
    while (isRun()) {
        unsigned char *values = readI2cReg(i2cFileDesc, STATUS_REG);
        x = ((values[1] << 8) | values[0]);
        y = ((values[3] << 8) | values[2]);
        z = ((values[5] << 8) | values[4]);
        int accel[3] = {x, y, z};
        // int accel[3] = {xAccl, yAccl, zAccl};
        Period_markEvent(PERIOD_EVENT_SAMPLE_ACCEL);
        // printf("x is: %d, y is %d, z is %d\n", x, y, z); // debug use
        if ((accel[0] / one_g) < -1.0* xy_threshold || (accel[0] / one_g) > xy_threshold) {
            // printf("x: %f\n", (accel[0] / one_g)); // debug use
            play_acc_sound(2); // 2 means hi_hat
            sleepForMs(200);
        }
        if ((accel[1] / one_g) < -1.0* xy_threshold || (accel[1] / one_g) > xy_threshold) {
            // printf("y: %f\n", (accel[1] / one_g)); // debug use
            play_acc_sound(3);  // 3 means snare
            sleepForMs(200);
        }
        if ((accel[2] / one_g) < -1.0* z_threshold || (accel[2] / one_g) > z_threshold) {
            // printf("z: %f\n", (accel[2] / one_g)); // debug use
            play_acc_sound(1);   // 1 means base drum
            sleepForMs(200);
        }
        free(values);
        values = NULL;
        sleepForMs(10);
    }
    return NULL;
}

// Createa a thread
void Accelerometer_init(void) {
    int result_thread;
    result_thread = pthread_create(&acc_thread, NULL, acc_function, NULL);
    //check if the thread is created sucessfully
    if (result_thread != 0){
        // if thread cration fails, exit the program
        perror("Thread Creation Error!\n");
        exit(1);
    }
}

// Shut down the thread
void Accelerometer_cleanup(void) {
    pthread_join(acc_thread, NULL);
    writeI2cReg(i2cFileDesc, CTRL_REG1, 0x07);
    close(i2cFileDesc);
}

