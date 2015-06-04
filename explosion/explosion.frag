// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform sampler2D tex;

void main()
{
	float y = mod(floor(time*30.0/8.0),6.0);
	float x = mod(floor(time*30.0),8.0);
	vec2 tc = gl_TexCoord[0].st;
	tc.s = tc.s/8.0 +x/8.0;
	tc.t = tc.t/8.0 + y/6.0;
	vec4 tex = texture2D(tex,tc);
	
	
	gl_FragColor = tex;
}
