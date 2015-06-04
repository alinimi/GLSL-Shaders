// simple vertex shader
uniform float time;
uniform float speed;
void main()
{
	float b = time*speed;
	vec3 vert = gl_Vertex.xyz;
	mat3 rotate = mat3(
		vec3(cos(b),0.0,-sin(b)),
		vec3(0.0,1.0,0.0),
		vec3(sin(b),0.0,cos(b)));
	vert = vec3(rotate*vert);
	gl_Position    = gl_ModelViewProjectionMatrix * vec4(vert,1);
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
