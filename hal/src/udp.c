#include "../../app/include/main.h"
#include "../include/hal/udp.h"
#include "../../app/include/audioGenerator.h"
#include "../../app/include/audioMixer.h"
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <pthread.h>
#include <netinet/in.h>
#include <string.h>
#include <unistd.h>

static pthread_t udp_thread; 
static int socket_net; 
static struct sockaddr_in sock_dest;
static int adjust_volume = 5;
static int adjust_tempo = 5;

// Initialize socket and bind
static void Socket_init(void) {
    socket_net = socket(PF_INET, SOCK_DGRAM, 0);
    //check if the socket is created sucessfully
    if(socket_net == -1){
        perror("Socket Creation Error!\n");
        exit(1);
    }
    struct sockaddr_in sock_a_in;
    memset(&(sock_a_in), 0, sizeof(sock_a_in));
    sock_a_in.sin_family = AF_INET;
    sock_a_in.sin_addr.s_addr = htonl(INADDR_ANY);
    sock_a_in.sin_port = htons(PORT);
    // bind
    int result_bind = bind(socket_net , (struct sockaddr*) &sock_a_in, sizeof(sock_a_in));
    if(result_bind == -1){
        perror("Bind Error!");
        exit(1); // if bind fails, exit
    }
}

static void* udp_function(void* unused) {   
    (void)unused;
    Socket_init();
    unsigned int sock_dest_len = sizeof(sock_dest);
    // char pre_msg[LENGTH] = "";
    while (isRun()) {
        char rec_msg[LENGTH] = "";
        int msgsize = recvfrom(socket_net, rec_msg, LENGTH, 0, (struct sockaddr *)&sock_dest, &sock_dest_len);
        rec_msg[msgsize] = '\0'; //add terminator
        if (strncmp(rec_msg, "mode1", 5) == 0) {
            change_mode_type(1); 
        } else if (strncmp(rec_msg, "mode2", 5) == 0) {
            change_mode_type(2); 
        } else if (strncmp(rec_msg, "mode3", 5) == 0) {
            change_mode_type(3); 
        } else if (strncmp(rec_msg, "volumeup", 8) == 0) {
            AudioMixer_setVolume(AudioMixer_getVolume() + adjust_volume);
            char updatevolume[LENGTH];
            sprintf(updatevolume, "updatevolume %d", AudioMixer_getVolume());
            sendto(socket_net, updatevolume, strlen(updatevolume), 0, (struct sockaddr *)&sock_dest, sock_dest_len);
        } else if (strncmp(rec_msg, "volumedown", 10) == 0) {
            AudioMixer_setVolume(AudioMixer_getVolume() - adjust_volume);
            char updatevolume[LENGTH];
            sprintf(updatevolume, "updatevolume %d", AudioMixer_getVolume());
            sendto(socket_net, updatevolume, strlen(updatevolume), 0, (struct sockaddr *)&sock_dest, sock_dest_len);
        } else if (strncmp(rec_msg, "tempodown", 9) == 0) {
            set_tempo(get_tempo() - adjust_tempo);
            char updatetempo[LENGTH];
            sprintf(updatetempo, "updatetempo %d", get_tempo());
            sendto(socket_net, updatetempo, strlen(updatetempo), 0, (struct sockaddr *)&sock_dest, sock_dest_len);
        } else if (strncmp(rec_msg, "tempoup", 7) == 0) {
            set_tempo(get_tempo() + adjust_tempo);
            char updatetempo[LENGTH];
            sprintf(updatetempo, "updatetempo %d", get_tempo());
            sendto(socket_net, updatetempo, strlen(updatetempo), 0, (struct sockaddr *)&sock_dest, sock_dest_len);
        }else if (strncmp(rec_msg, "hi-hat", 6) == 0) {
            play_acc_sound(2); // 2 means hi_hat
        } else if (strncmp(rec_msg, "snare", 5) == 0) {
            play_acc_sound(3); // 3 means snare
        } else if (strncmp(rec_msg, "basedrum", 8) == 0) {
            play_acc_sound(1); // 1 means base drum
        } else if (strncmp(rec_msg, "stop", 4) == 0) {
            Program_terminate(); // terminate the program
        } else {
            char updatestatus[LENGTH];
            char msg1[LENGTH]; 
            if (get_model() == 0) {
                strcpy(msg1, "updatestatus Rock#1");
            } else if (get_model() == 1) {
                strcpy(msg1, "updatestatus Rock#2");
            } else if (get_model() == 2) {
                strcpy(msg1, "updatestatus None");
            }
            char vol[LENGTH];
            sprintf(vol, " %d", AudioMixer_getVolume());
            strcat(msg1, vol);
            char tem[LENGTH];
            sprintf(tem, " %d", get_tempo());
            strcat(msg1, tem);
            sprintf(updatestatus, "%s", msg1);
            sendto(socket_net, updatestatus, strlen(updatestatus), 0, (struct sockaddr *)&sock_dest, sock_dest_len);

        }
        char updatemode[LENGTH];
        char msg1[LENGTH]; 
        if (get_model() == 0) {
            strcpy(msg1, "updatemode Rock#1");
        } else if (get_model() == 1) {
            strcpy(msg1, "updatemode Rock#2");
        } else if (get_model() == 2) {
            strcpy(msg1, "updatemode None");
        }
        sprintf(updatemode, "%s", msg1);
        sendto(socket_net, updatemode, strlen(updatemode), 0, (struct sockaddr *)&sock_dest, sock_dest_len);
    }
    return NULL;
}

// Createa a  camera thread
void UDP_init(void) {
    int result_thread;
    result_thread = pthread_create(&udp_thread, NULL, udp_function, NULL);
    //check if the thread is created sucessfully
    if (result_thread != 0){
        // if thread cration fails, exit the program
        perror("Thread Creation Error!\n");
        exit(1);
    }
}

// Shut down the thread, and close the camera
void UDP_cleanup(void) {
    pthread_join(udp_thread, NULL);
}