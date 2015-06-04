// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform sampler2D inter;
uniform sampler2D grass;
uniform sampler2D rock;
void main()
{
	vec4 y = texture2D(inter,gl_TexCoord[0].st);
	float x = y.g;
	vec4 color = x*texture2D(rock,gl_TexCoord[0].st);
	color+=(1.0-x)*texture2D(grass,gl_TexCoord[0].st);
	gl_FragColor =color;
}
