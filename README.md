# RBG Pattern HLSL Shader
This HLSL shader reduces the R, G, and B channels across a target image based on a repeating input pattern.
The pattern will be repeated 'pixel-for-pixel' across the image, and the R, G, and B channels of each pixel will be reduced to a percentage of the origional colour value based on the corrosponding RBG colour in the input pattern.                                                                                                               

E.g. If the corrosponding pixel position in the input pattern is **0, 255, 127**, the red channel will become **(0/255) × origionalRed**, the green channel will become **(255/255) × origionalGreen**, and the blue channel will become **(127/255) × origionalBlue**

-------- **Example using the shader to create a repeating brick wall effect** --------

![Example Image](https://github.com/Ben-G-Man/RGB-Pattern-HLSL-Shader/blob/main/ExampleImages/ExampleImage1.png?raw=true)

-------- **Example using the shader to create a repeating LED screen effect** --------

![Example Image](https://github.com/Ben-G-Man/RGB-Pattern-HLSL-Shader/blob/main/ExampleImages/ExampleImage2.png?raw=true)

Image Credits: Character art by Sam Hume, lead artist on the currently unreleased *Super Heavy* game.

-------- **Usage** --------    

1   Create a square RGB filter pattern as outlined above.                                                                                                               
2   Import the pattern into the 'RGB Pattern' variable                                                                                                               
3   Set the pattern size to the RGB pattern dimensions, or to a smaller dimension if you'd like to crop the pattern.                                                                                                               
