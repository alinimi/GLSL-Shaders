// simple vertex shader

vec3 vobs;

vec3 normalVector(){
	return gl_NormalMatrix*gl_Normal;
}

vec4 emissio(){
	return gl_FrontMaterial.emission;
}
vec4 ambient(){
	vec4 k = gl_FrontMaterial.ambient;
	vec4 i = gl_LightSource[0].ambient;
	vec4 m = gl_LightModel.ambient;
	return k*(i+m);
}
vec4 diffuse(){
	vec4 k = gl_FrontMaterial.diffuse;
	vec4 i = gl_LightSource[0].diffuse;
	vec3 n = normalize(gl_NormalMatrix*gl_Normal);
	vec3 l = gl_LightSource[0].position.xyz-vobs;
	float ln = max(0.0,dot(normalVector(),l));
	return k*i*ln;
}

vec4 specular(){
	vec4 k = gl_FrontMaterial.specular;
	vec4 i = gl_LightSource[0].specular;
	vec3 h = gl_LightSource[0].halfVector.xyz;
	float s = gl_FrontMaterial.shininess;
	float ny = max(0.0,dot(normalVector(),h));
	return k*i*h*pow(ny,s);
}


void main()
{

	
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	vec4 x = gl_ModelViewMatrix*gl_Vertex;
	vobs = normalize(x.xyz);
	vec4 light = emissio()+ambient()+diffuse()+specular();
	gl_FrontColor  = light;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
