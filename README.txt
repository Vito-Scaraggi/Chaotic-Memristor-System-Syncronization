//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

###########
# The app ############################################################################################################################################################
###########

'The synchronization of identical Memristors systems via Lyapunov direct method' is a Matlab application that implements the results included in the research article 
'Shko A. TAHIR. The Synchronization of Identical Memristors Systems Via Lyapunov Direct Method. Applied and Computational Mathematics' published in Nov 6 2013.

The application has been developed with Matlab version R2020a and App designer. 

###############
#  Use cases  ########################################################################################################################################################
###############

The application simulates the behaviour of two distinct chaotic memristor systems in three different conditions (no syncronization, master-slave syncronization and
active syncronization) by displaying 2D and 3D graphics.

################
# Instructions #######################################################################################################################################################
################

Install Matlab (preferably version R2020a). Save all files in the same folder, then open the scrip 'Main.m' in Matlab and run it.

#########
#  GUI  ##############################################################################################################################################################
#########

GUI displays two different tabs:

- Settings
	
	It allows to set synchronization mode ('Mode'), syncronization coefficients ('coeff1' and 'coeff2') and the type of graph.

- Parameters 

	It allows to set some specific parameters such as:

	> 'Time step' which corresponds to time unit used in the forth order Runge-Kutta method for simulating memristor systems;
	
	> 'Step number' which corresponds to the desired number of steps;
	
	> 'Time delta' which defines a phase displacement between memristor systems (hover the mouse on 'Time delta' for more details);
	
	> Initial conditions
	
	In this tab, RANDOM button provides a quick way to generate casual initial conditions.

In the bottom-left corner there are four buttons:

- push SUBMIT to draw the selected graphics with chosen parameters;

- push START ANIMATION to display an animation (only 3D graphics);

- push CLEAR ALL to delete graphics;

- push CLEAR ANIMATION to delete animation.

If you want to save or print a graph, hover the mouse on it and click on the icons that appear.
		
##################
# Recommendation #####################################################################################################################################################
##################

Application works with any value of aforementioned parameters but in order to observe better the synchronization phoenomenon, follow these tips:

- set low value of 'Time steps' ( suggested 'Time step': 0.01 )

- do not exceed with number of step ( suggested 'Step number' : 1000 )

- set initial conditions with a low absolute value ( suggested range of values: [-1, 1] )

Ignoring these tips could bring the state of memristor systems to diverge to very high values.


###################
# Possible errors ####################################################################################################################################################
###################

Don't panic if one of the following error occurs:

- ' >>> APP ERROR : Unavailable animation. Select 3D plots'
	Fix it by selecting 3D plots.
	
- ' >>> APP ERROR : State of the program has been changed. Press SUBMIT button first'
	Fix it by pushing SUBMIT button.
	
- ' >>> PARAM ERROR : time delta cannot be greater than step number'
	Fix it by setting a 'Time delta' lower than 'Step number'.
	
- ' >>> MATH ERROR : function W is undefined for w = ±1'
	Check if initial conditions 'w1' and 'w2' are equal to ±1. If so, change these values and press SUBMIT otherwise you can't fix the error unless you change 
	some of initial conditions (never happened in tests).

##########
# Author #############################################################################################################################################################
##########

Vito Scaraggi, student of IT and Automation Engeneering at UNIVPM (Ancona)

###############
# Last update ########################################################################################################################################################
###############

Feb 24 2021

###########
# License ############################################################################################################################################################
###########

Open source

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////