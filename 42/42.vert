// simple vertex shader

attribute vec3 attrTangent;
attribute vec3 attrBitangent;
uniform float d;
uniform float time;
vec3 normal;

mat3 transpose3(){
	vec3 a = vec3(attrTangent.x, attrBitangent.x, normal.x);
	vec3 b = vec3(attrTangent.y, attrBitangent.y, normal.y);
	vec3 c = vec3(attrTangent.z, attrBitangent.z, normal.z);
	return mat3(a,b,c);
}

void main()
{
	normal = cross(attrTangent,attrBitangent);
	mat3 fromTan = mat3(attrTangent,attrBitangent,normal);
	mat3 toTan = transpose3();
	vec3 vert = gl_Vertex.xyz;
	vert = toTan*vert;
	float t = time+2.0*3.1416*(gl_MultiTexCoord0.s+gl_MultiTexCoord0.t);
	vert.x = vert.x+cos(t)*d;
	vert.y = vert.y+sin(t)*d;
	

	


	vert = fromTan*vert;

	gl_Position    = gl_ModelViewProjectionMatrix * vec4(vert,1);

	
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
