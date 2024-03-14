#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include "../include/output.h"
#include "../include/main.h"
#include "../include/audioGenerator.h"
#include "../include/audioMixer.h"
#include "../include/periodTimer.h"

static pthread_t output_thread; 


static void* output_function(void* unused) {
    (void)unused;
    while (isRun()) {
        printf("M%d %dbpm vol:%d  ", get_model(), get_tempo(), AudioMixer_getVolume());
        Period_statistics_t pStats;
        Period_getStatisticsAndClear(PERIOD_EVENT_SAMPLE_AUDIO, &pStats);
        printf("%s[%6.3f, %6.3f] avg %6.3f/%2d  ", "Audio", pStats.minPeriodInMs, pStats.maxPeriodInMs, 
               pStats.avgPeriodInMs, pStats.numSamples);
        Period_statistics_t ppStats;
        Period_getStatisticsAndClear(PERIOD_EVENT_SAMPLE_ACCEL, &ppStats);
        printf("%s[%6.3f, %6.3f] avg %6.3f/%2d", "Accel", ppStats.minPeriodInMs, ppStats.maxPeriodInMs, 
               ppStats.avgPeriodInMs, ppStats.numSamples);
        printf("\n");
        sleepForMs(1000);
    }
    return NULL;
}

// create the thread
void output_init(void) {
    int result_thread;
    result_thread = pthread_create(&output_thread, NULL, output_function, NULL);
    //check if the thread is created sucessfully
    if (result_thread != 0){
        // if thread cration fails, exit the program
        perror("Thread Creation Error!\n");
        exit(1);
    }
}

// shut down the thread
void output_cleanup(void) {
    pthread_join(output_thread, NULL);
}