// simple vertex shader
uniform float time;
void main()
{
	
	vec3 vertex = gl_Vertex.xyz;
	float angle = 0.4*vertex.y*sin(time);	
	vec3 c1 = vec3(cos(angle),0,-sin(angle));
	vec3 c2 = vec3(0,1,0);
	vec3 c3 = vec3(sin(angle),0,cos(angle));
	mat3 rot = mat3(c1,c2,c3);
	vertex = rot*vertex;
	gl_Position    = gl_ModelViewProjectionMatrix * vec4(vertex,1);
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
