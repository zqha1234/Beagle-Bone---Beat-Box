#ifndef UDP_H
#define UDP_H

// the upd.c program will listen to the input from the website, and conduct actions according to the 
// info received from the website. actions include increase / decrease the volume and tempo, chage mode,
// play certain souds, and terminiaget the program. 

// define the port number, and pack length for the message
#define PORT 12345
#define LENGTH 1024

// create the thread
void UDP_init(void);
// clean up the thread
void UDP_cleanup(void);

#endif