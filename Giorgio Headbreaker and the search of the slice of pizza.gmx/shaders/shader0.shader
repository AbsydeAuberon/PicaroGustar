//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float dump01 (float);

void main()
{
    vec4 originalColor=texture2D(gm_BaseTexture,v_vTexcoord);
    
    float outputRed=1.0-originalColor.r;
    float outputGreen=1.0-originalColor.g;
    float outputBlue=1.0-originalColor.b;
    float outputAlpha=originalColor.a;
    //float average=(originalColor.r+originalColor.b+originalColor.g)/3.0;
    
    vec4 outputColor=vec4(outputRed,outputGreen,outputBlue,outputAlpha);
    
    gl_FragColor = outputColor;
    
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
/*
float dump01(float number)
{
    if (number > 1.0)
        return 1.0;
    if (number < 0.0)
        return 0.0;
    return number;
}*/
