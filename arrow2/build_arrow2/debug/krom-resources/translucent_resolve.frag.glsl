#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform sampler2D gbuffer0;
uniform vec2 texSize;
uniform sampler2D gbuffer1;

in vec2 texCoord;
out vec4 fragColor;

float maxComponent(vec4 v)
{
    return max(max(max(v.x, v.y), v.z), v.w);
}

void main()
{
    vec4 accum = texelFetch(gbuffer0, ivec2(texCoord * texSize), 0);
    float revealage = 1.0 - accum.w;
    if (revealage == 0.0)
    {
        discard;
    }
    vec4 param = abs(accum);
    if (isinf(maxComponent(param)))
    {
        vec3 _74 = vec3(revealage);
        accum = vec4(_74.x, _74.y, _74.z, accum.w);
    }
    float f = texelFetch(gbuffer1, ivec2(texCoord * texSize), 0).x;
    fragColor = vec4(accum.xyz / vec3(clamp(f, 9.9999997473787516355514526367188e-05, 50000.0)), revealage);
}

