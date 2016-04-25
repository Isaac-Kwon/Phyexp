#Wave Function Simulation
Tested by MATLAB 2016a

##Diffraction
The m-Files for Drawing diffraction of surface wave and Light

1. Single Slit Diffraction (SurfaceWave)
2. Double Slit Diffraction (SurfaceWave)
3. Single Slit Diffraction (Light) - 2D plot
4. Double Slit Diffraction (Light) - 2D plot

###File Detail

* All plot's xlimit and ylimit is set [0, 20] <br>

1. Single Slit Diffraction (Surface Wave)
  - diffractionFunctionplot.m <br>
  The function file for Surf Plot. <br>
  input : slit hole width, wavelength <br>
  
  - diffraction.m <br>
  Script file to make plots on grid of subplots. <br>
  Make 3 by 3 subplot. <br>
  can put variance and compare.

2. Double Slit Diffraction and Interference (Surface Wave)
  - InterferenceFunctionplot.m <br>
  The function file for Surf Plot. <br>
  input :  wavelength, slit size, slit gap (length of wall between slit hole) <br>
  
  - Interference.m <br>
  Script file to make plots on grid of subplots. <br>
  Make 3 by 3 subplot. <br>
  can put variance and compare.

3.  Single Slit Diffraction (Light)
  - diffractionFunctionplot2.m <br>
  The function file for 2D plot<br>
  input : slit size, wavelength, distance to screen <br>
  It makes intensity graph of light's single slit diffraction.<br>
  
  
4.  Double Slit Diffraction and Interference (Light)
  - InterferenceFunctionplot2.m <br>
  The function file for 2D plot<br>
  input : wavelength, slit size, slit gap, plot range - xrange, distance to screens <br>
  It makes intensity graph of light's double slit diffraction and interference.<br>

  - interference2.m <br>
  Script file to make plots <br>
  It help making plot. (Specify variable with comment)




  
###Revision
  * 2016 - 04 - 07 <br>
Paralell Operation Optimization - Using Matrix Operation (Surface wave) <br>
  * 2016 - 04 - 10 <br>
Paralell Operation Optimization - Using Matrix Operation (Light) <br>
  * 2016 - 04 - 25 <br>
Add Function of Light Diffraction and Interference <br>
Rename (Ddiffraction -> Interference)

