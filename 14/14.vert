// simple vertex shader

uniform float A;
uniform float F;
uniform float time;

void main()
{
	vec3 vertex = gl_Vertex.xyz;
	vec3 normal = gl_Normal;
	float fase = 2* 3.1416*gl_MultiTexCoord0.s;
	float dt = A*sin(2*3.1416*F*time+fase);
	vertex = vertex + dt*normal;
	gl_Position    = gl_ModelViewProjectionMatrix * vec4(vertex,1);
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
