#version 450
#define _Irr
#define _EnvCol
#define _Deferred
#define _CSM
#define _SSAO
#include "compiled.glsl"
#include "std/brdf.glsl"
#include "std/math.glsl"
#include "std/shirr.glsl"
#include "std/shadows.glsl"
#include "compiled.glsl"
in vec3 wnormal;
in vec3 eyeDir;
in vec4 lampPos;
in vec4 wvpposition;
in vec3 wposition;
out vec4[2] fragColor;
uniform vec3 lightColor;
uniform vec3 lightDir;
uniform vec3 lightPos;
uniform int lightType;
uniform vec2 spotlightData;
uniform float envmapStrength;
uniform sampler2D shadowMap;
uniform samplerCube shadowMapCube;
uniform bool receiveShadow;
uniform float shadowsBias;
uniform int lightShadow;
uniform vec2 lightProj;
uniform vec3 eye;
uniform vec3 backgroundCol;
void main() {
vec3 n = normalize(wnormal);

    vec3 vVec = normalize(eyeDir);
    float dotNV = max(dot(n, vVec), 0.0);

	vec3 basecol;
	float roughness;
	float metallic;
	float occlusion;
	float specular;
	float opacity;
	basecol = vec3(0.8);
	roughness = 0.0;
	metallic = 0.0;
	occlusion = 1.0;
	specular = 1.0;
	opacity = (1.0 - vec3(1.0, 1.0, 1.0).r);
	float visibility = 1.0;
	vec3 lp = lightPos - wposition;
	vec3 l;
	if (lightType == 0) l = lightDir;
	else { l = normalize(lp); visibility *= attenuate(distance(wposition, lightPos)); }
	vec3 h = normalize(vVec + l);
	float dotNL = dot(n, l);
	float dotNH = dot(n, h);
	float dotVH = dot(vVec, h);
	if (receiveShadow) {
	    if (lightShadow == 1) {
	vec2 smSize;
	vec3 lPos;
	if (lightType == 0) {
	    int casi;
	    int casindex;
	    mat4 LWVP = getCascadeMat(distance(eye, wposition), casi, casindex);
	    vec4 lampPos = LWVP * vec4(wposition, 1.0);
	    lPos = lampPos.xyz / lampPos.w;
	    smSize = shadowmapSize * vec2(shadowmapCascades, 1.0);
	}
	else {
	    lPos = lampPos.xyz / lampPos.w;
	    smSize = shadowmapSize;
	}
	    visibility *= PCF(shadowMap, lPos.xy, lPos.z - shadowsBias, smSize);
	    }
	    else if (lightShadow == 2) visibility *= PCFCube(shadowMapCube, lp, -l, shadowsBias, lightProj, n);
	}
	if (lightType == 2) {
	    float spotEffect = dot(lightDir, l);
	    if (spotEffect < spotlightData.x) {
	        visibility *= smoothstep(spotlightData.y, spotlightData.x, spotEffect);
	    }
	}
	vec3 albedo = surfaceAlbedo(basecol, metallic);
	vec3 f0 = surfaceF0(basecol, metallic);
	vec3 direct;
	direct = lambertDiffuseBRDF(albedo, dotNL);
	direct += specularBRDF(f0, roughness, dotNL, dotNH, dotNV, dotVH) * specular;
	vec3 indirect = shIrradiance(n);
	indirect *= albedo;
	indirect += backgroundCol * f0;
	indirect *= envmapStrength;	

	vec4 premultipliedReflect = vec4(vec3(direct * lightColor * visibility + indirect * occlusion) * opacity, opacity);
	float fragZ = wvpposition.z / wvpposition.w;
	float w = clamp(pow(min(1.0, premultipliedReflect.a * 10.0) + 0.01, 3.0) * 1e8 * pow(1.0 - fragZ * 0.9, 3.0), 1e-2, 3e3);
	fragColor[0] = vec4(premultipliedReflect.rgb * w, premultipliedReflect.a);
	fragColor[1] = vec4(premultipliedReflect.a * w, 0.0, 0.0, 1.0);
}
