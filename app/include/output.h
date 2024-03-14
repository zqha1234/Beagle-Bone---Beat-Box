#ifndef OUTPUT_H_
#define OUTPUT_H_

// the output.c program out put the info, such as mode, volume, tempo, audio samples avg, and acceleration 
// samples avg.

// Begin/end the background thread which output to screen
void output_init(void);
void output_cleanup(void);

#endif