# HilltoppingAssignment
Assignment for WILD7400 at Auburn University

In order to determine whether butterflies use "corridors" to find the top of a hill, I created flexible functions that allow a user to:
1. generate a landscape of a specified number of patches with one hilltop in a random location, and sloping topography towards the landscape boundaries. each patch is assigned an elevation value based on the location of the hilltop patch.
2. generate the starting locations of a population of butterflies of a specified size
3. move the population across the landscape towards the hilltop (or randomly) with a specified probability
4. gather output from multiple simulated populations on the same landscape

output is generated with the run_model() function.

the required inputs for the run_model() function are a list of parameters called "starts", and a number of populations to simulate called "iter".
"starts" is a named list with the following components, and example values:
elevation   #peak elevation min and max
landscape   #number of patches on each side, total patch number = landscape*landscape
nindvs      #number of individuals to simulate in a population
nsteps      #number of steps an individual can take
move        #decimal probability of moving to highest neighbor patch (NOT to a random neighbor patch)
originwidth #width of the square patch on which to originate the population

starts=list(elevation=c(0, 400), landscape =150, nindvs=50, nsteps=500, move=0.8)

The output takes the form of a list with three components
1. a matrix of all butterfly locations during the simulation (aggregated across individuals: dimensions= 2 columns, and nindvs*nsteps*iter rows)
2. a list of starting location matrices for each simulated population (dim = iter x 2 x nindvs)
3. the randomly generated landscape for that set of iterations (a new landscape is generated each time the function is executed)

the user may execute the run_model() function, and then plot the output to visualize corridors on the landscape
I suggest using the script titled "RunModel.R" to test the functions and visualize the output.
Tweak the starting parameters, and the functions that generate the population and landscape will run in the background according to those settings.

Based on experiments with 5 populations, and numerous random landscapes, the butterflies do use corridors. Given that the landscape has one hilltop, and four "ridges" extending in the cardinal directions away from the hilltop, butterflies travel to the nearest ridge, depending on their quadrant of origin, and then travel along the ridge towards the hilltop linearly.


