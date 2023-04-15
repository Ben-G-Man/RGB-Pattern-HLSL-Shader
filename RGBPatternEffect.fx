/*  RBG PATTERN EFFECT
        Description:    This HLSL shader modulates R, G, and B channels across a target image based 
                        on a repeating input pattern.
        Author:         Benjamin Hume */

struct PS_INPUT
{
    float4 Position   : POSITION;
    float2 Texture    : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 Color   : COLOR0;
};

/*  VARIABLES
        img:                A reference to the 2D image that is being processed
        pattern:            A reference to the square RGB pattern input image
        fPixelWidth:        An inherited value corosponding with 1/width of the image
        fPixelHeight:       An inherited value corosponding with 1/height of the image
        pSize:              An integer value representing the pixel width / height of the input pattern */
sampler2D img;
sampler2D pattern : register(s1);
float fPixelWidth;
float fPixelHeight;
int pSize;

PS_OUTPUT ps_main(in PS_INPUT In)
{
    PS_OUTPUT pixelOut;
    pixelOut.Color = tex2D(img, In.Texture);

    int xPos = (1 / fPixelWidth) * In.Texture.x; // Calculating the current horizontal position across the image
    int yPos = (1 / fPixelHeight) * In.Texture.y; // Calculating the current vertical position across the image
    float2 subPos;
    subPos.x = (xPos % pSize) / float(pSize); // Calculating the horizontal position across the RGB pattern
    subPos.y = (yPos % pSize) / float(pSize); // Calculating the vertical position across the RGB pattern

    pixelOut.Color.r = pixelOut.Color.r * tex2D(pattern, subPos).r;
    pixelOut.Color.g = pixelOut.Color.g * tex2D(pattern, subPos).g;
    pixelOut.Color.b = pixelOut.Color.b * tex2D(pattern, subPos).b;

    return pixelOut;
}

technique tech_main { pass P0 { PixelShader = compile ps_2_0 ps_main(); } }