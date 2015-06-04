// simple vertex shader
varying vec3 Vobs, Nobs;

vec3 GetAmbient(){
	return gl_FrontMaterial.ambient.rgb*(
		gl_LightModel.ambient.rgb+
		gl_LightSource[0].ambient.rgb
	);
}
vec3 GetDiffuse(vec3 Nobs, vec3 L){
	return gl_FrontMaterial.diffuse.xyz*
		gl_LightSource[0].diffuse.xyz*
		max(0.0,dot(Nobs,L));
}


vec3 GetSpecular(vec3 Nobs, vec3 H){
	return gl_LightSource[0].specular.xyz*
		gl_FrontMaterial.specular.xyz*
		pow(max(0.0,dot(Nobs,H)),gl_FrontMaterial.shininess);
}



void main()
{
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	
	Vobs = vec3(gl_ModelViewMatrix*gl_Vertex);
	Nobs = vec3(gl_NormalMatrix*gl_Normal);



	vec3 L = gl_LightSource[0].position.xyz-Vobs;
	L = normalize(L);

	vec3 color = GetAmbient();

	color +=GetDiffuse(Nobs,L);
	
	vec3 R = normalize(reflect(-L,Nobs));
	color += GetSpecular(Nobs,R);
	gl_FrontColor = vec4(color.rgb,1);
}
