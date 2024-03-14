#ifndef AUDIO_GENERATOR_H
#define AUDIO_GENERATOR_H

// the audiGenerator.c program will create a thread to cycle play the modes (three modes - standard, custom, none).
// and it can set the tempo, get the tempo, set the mode type, change teh mode type, play certain sound (base_drum,
// hi_hat, and sanre).
 

// define the MAX_TEMPO, MIN_TEMPO and DEFAULT_TEMPO
#define MAX_TEMPO 300
#define MIN_TEMPO 40
#define DEFAULT_TEMPO 120

// define the three sounds which will be used in this assignment
#define BASE_DRUM "wave-files/100051__menegass__gui-drum-bd-hard.wav"
#define HI_HAT "wave-files/100053__menegass__gui-drum-cc.wav"
#define SNARE "wave-files/100059__menegass__gui-drum-snare-soft.wav"

// Delay in ms
void sleepForMs(long long delayInMs);
// create the thread 
void audio_gen_init(void);
// clean up the thread
void audio_gen_cleanup(void);
// set the tempo
void set_tempo(int new_tempo);
// get the tempo
int get_tempo(void);
// set the mode type
void set_mode_type(void);
// paly certain sound (BASE_DRUM, HI_HAT, SNARE)
void play_acc_sound (int s);
// get the model
int get_model(void);
// chage the model type
void change_mode_type(int modenum) ;

#endif
