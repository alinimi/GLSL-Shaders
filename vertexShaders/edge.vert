// simple vertex shader

varying vec3 nobs;
varying vec3 vobs;
void main()
{
	vobs = (gl_ModelViewMatrix*gl_Vertex).xyz;
	nobs = gl_NormalMatrix*gl_Normal;
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
