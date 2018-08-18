% Module 10.5.2 - Jeremy Griffith
% One problem with the module's simulation is the formation of long
% dendritic structures, which do not occur so frequently in biofilms (see
% Figure 10.5.2, t = 125). We have not considered the loss of pieces from
% the biofilm due to erosion, abrasion, grazing, or sloughing (Picioreanu
% et al. 1996). Adjust the biofilm simulation so that it shows the erosion
% of surface bacteria. Similar to Project 1, release an inert particle one
% at a time from a random location east of the biofilm and have the
% particle go on a random walk. If a particle touches a bacterium, making
% its cell empty. Have biofilm execute one step of this random walk (after
% consumption) at each time step. Notice that erosion only occurs on the
% surface of the biofilm. Discuss impact of allowing erosion on the
% structure. Which bacteria are most likely to erode?

% m, n, probInitBacteria, diffusionRate, p, t
[ bacGrids, nutGrids ] = biofilm( 50, 20, 0.5, 0.1, 0.3, 125 );
