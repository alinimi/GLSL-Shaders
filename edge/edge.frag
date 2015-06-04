// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform float epsilon;
uniform float light;
varying vec3 nobs;
varying vec3 vobs;
vec4 cl = vec4(0.7,0.6,0.0,1.0);
void main()
{
	vec3 cam = normalize(-vobs);
	if(abs(dot(nobs,cam)) < epsilon){
		gl_FragColor = cl;
	}
	else gl_FragColor = gl_Color*light*nobs.z;
}
