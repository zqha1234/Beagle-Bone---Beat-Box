#include "audioGenerator.h"
#include "audioMixer.h"
#include "main.h"
#include <pthread.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>

static pthread_t audio_gen_thread;
static int tempo = DEFAULT_TEMPO;
static wavedata_t base_drum;
static wavedata_t hi_hat;
static wavedata_t snare; 
static long long mode_type = 0;

// Delay in ms
void sleepForMs(long long delayInMs) {
    const long long NS_PER_MS = 1000 * 1000;
    const long long NS_PER_SECOND = 1000000000;
    long long delayNs = delayInMs * NS_PER_MS;
    int seconds = delayNs / NS_PER_SECOND;
    int nanoseconds = delayNs % NS_PER_SECOND;
    struct timespec reqDelay = {seconds, nanoseconds};
    nanosleep(&reqDelay, (struct timespec *) NULL);
}

// get tempo
int get_tempo(void) {
    return tempo;
}

// set tempo
void set_tempo(int new_tempo) {
    if (new_tempo >= MIN_TEMPO && new_tempo <= MAX_TEMPO) {
        tempo = new_tempo;
    } else {
        printf("ERROR: Tempo must be between 40 and 300.");
    }
}

// set mode_type
void set_mode_type(void) {
    mode_type++;
    // printf("%lld\n", mode_type);
}

// chage mode_type according to udp msg
void change_mode_type(int modenum) {
    mode_type = modenum + 1;
}

static void beat_wait() {
    long long wait = 60.0 / tempo / 2.0 * 1000; // convert time to ms
    sleepForMs(wait);
}

static void read_wav_file() {
    AudioMixer_readWaveFileIntoMemory(BASE_DRUM, &base_drum);
	AudioMixer_readWaveFileIntoMemory(HI_HAT, &hi_hat);
	AudioMixer_readWaveFileIntoMemory(SNARE, &snare);
}

// no drum beat
static void mode1(void) {

}

// standard rock beat (as descriped in assignment description)
static void mode2(void) {
    for (int i = 0; i < 4; i++) {
        AudioMixer_queueSound(&hi_hat);
        AudioMixer_queueSound(&snare);
        beat_wait();
        AudioMixer_queueSound(&hi_hat);
        beat_wait();
    }
}

// custom drum beat
static void mode3(void) {
    for (int i = 0; i < 4; i++) {
        AudioMixer_queueSound(&base_drum);
        AudioMixer_queueSound(&snare);
        AudioMixer_queueSound(&snare);
        beat_wait();
        AudioMixer_queueSound(&base_drum);
        beat_wait();
    }
}

void play_acc_sound (int s) {
    if (s == 1) {
        AudioMixer_queueSound(&base_drum);
    } else if (s == 2) {
        AudioMixer_queueSound(&hi_hat);
    } else if (s == 3) {
        AudioMixer_queueSound(&snare);
    }
}

// get model
int get_model(void) {
    return (mode_type % 3);
}

static void *audio_gen_function(void* unused) {
    (void)unused;
    read_wav_file();
    while (isRun()) {
        if (mode_type % 3 == 0) {
            mode2();
        } else if (mode_type % 3 == 1) {
            mode3();
        } else if (mode_type % 3 == 2) {
            sleepForMs(500);
            mode1();
        }
        beat_wait();
    }
    return NULL;
}

// create the thread
void audio_gen_init(void) {
    int result_thread;
    result_thread = pthread_create(&audio_gen_thread, NULL, audio_gen_function, NULL);
    //check if the thread is created sucessfully
    if (result_thread != 0){
        // if thread cration fails, exit the program
        perror("Thread Creation Error!\n");
        exit(1);
    }
}

// shut down the thread
void audio_gen_cleanup(void) {
    pthread_join(audio_gen_thread, NULL);
}




