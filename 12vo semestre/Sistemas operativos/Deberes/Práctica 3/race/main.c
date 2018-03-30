/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*- */
/*
 * main.c
 * Copyright (C) Daniel Ochoa Donoso 2011 <dochoa@fiec.espol.edu.ec>
 * 
 * main.c is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * main.c is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <unistd.h>
#include <math.h> 
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
#define NUM_THREADS 5
 
int sum=0,scope,i; /* this data is shared by the thread(s) */

void *runner(void *param); /* the thread */


int main(int argc, char *argv[])
{
pthread_t tida[NUM_THREADS]; /* the thread identifier */
pthread_attr_t attr; /* set of attributes for the thread */
void *status;
struct tm tv;

ctime(&tv);
srand(tv.tm_sec);	

if (argc != 2) {
	fprintf(stderr,"usage: a.out <integer value>\n");	
	return -1;
}

if (atoi(argv[1]) < 0) {
	fprintf(stderr,"Argument %d must be non-negative\n",atoi(argv[1]));	
	return -1;
}

/* get the default attributes */
pthread_attr_init(&attr);
pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
for (i=0;i<NUM_THREADS;i++)
{
	pthread_create(&tida[i],&attr,runner,argv[1]);
}

pthread_attr_destroy(&attr);

for (i=0;i<NUM_THREADS;i++)
{
	pthread_join(tida[i],&status);	
}

printf("sum = %d\n",sum);

pthread_exit(NULL);

return(0);
}


/**
 * The thread will begin control in this function
 */
void *runner(void *param) 
{
int j,i, upper = atoi(param);

	if (upper > 0) {
		for (i = 1; i <= upper; i++)
		{			
			j=(int)(100.0*rand()/RAND_MAX);
			usleep(j);					
			sum++;
		}
	}
	pthread_exit(0);
}
