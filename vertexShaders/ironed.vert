// simple vertex shader

uniform float A;
uniform float time;
void main()
{
	vec4 v = gl_Vertex;
	v.y = A*sin(2.0*3.1416*v.x+3*time);
	gl_Position    = gl_ModelViewProjectionMatrix * v;
	gl_FrontColor  = vec4(1.0,0.0,0.0,0.0);
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
