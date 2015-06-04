// simple vertex shader

void main()
{
	vec3 vert = gl_Vertex.xyz;
	float prop = 1.0/(sqrt(pow(vert.x,2.0)+pow(vert.y,2.0)+pow(vert.z,2.0)));
	vert.x *= prop;
	vert.y *= prop;
	vert.z *= prop;
	gl_Position    = gl_ModelViewProjectionMatrix * vec4(vert,1.0);
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
