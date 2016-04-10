#Wave Function Simulation
Tested by MATLAB 2016a

##Diffraction
The m-Files for Drawing diffraction of surface wave and Light

1. Single Slit Diffraction
2. Double Slit Diffraction

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

2. Double Slit Diffraction and interference (Surface Wave)
  - DdiffractionFunctionplot.m <br>
  The function file for Surf Plot. <br>
  input :  wavelength, slit hole width, slit gap (length of wall between slit hole) <br>
  
  - Ddiffraction.m <br>
  Script file to make plots on grid of subplots. <br>
  Make 3 by 3 subplot. <br>
  can put variance and compare.

3.  Single Slit Diffraction (Light)
  - diffractionFunctionplot2.m <br>
  The function file for 2D plot<br>
  input : slit hole width, wavelength, distance between slit and screen <br>
  It makes intensity graph of light's single slit diffraction.<br>
  A few part didn't optimize paralell operation (Martix Operation) - will be very slow

  
###Revision
  * 2016 - 04 - 07 <br>
Paralell Operation Optimization - Using Matrix Operation (Surface wave) <br>
  * 2016 - 04 - 10 <br>
Paralell Operation Optimization - Using Matrix Operation (Light) <br>

