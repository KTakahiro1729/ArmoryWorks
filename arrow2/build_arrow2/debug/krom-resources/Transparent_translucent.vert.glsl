#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform mat4 W;
uniform mat3 N;
uniform mat4 WVP;
uniform vec3 eye;
uniform int lightShadow;
uniform mat4 LWVP;

in vec3 pos;
out vec3 wposition;
out vec3 wnormal;
in vec3 nor;
out vec3 eyeDir;
out vec4 lampPos;
out vec4 wvpposition;

void main()
{
    vec4 spos = vec4(pos, 1.0);
    wposition = vec4(W * spos).xyz;
    wnormal = normalize(N * nor);
    gl_Position = WVP * spos;
    eyeDir = eye - wposition;
    if (lightShadow == 1)
    {
        lampPos = LWVP * spos;
    }
    wvpposition = gl_Position;
}

