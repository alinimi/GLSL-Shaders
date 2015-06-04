// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform float slice;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D tex3;
uniform sampler2D tex4;

void main()
{
	float file = mod(time/slice,4.0);
	vec4 tex;
	if(file < 1.0){
		tex = texture2D(tex1,gl_TexCoord[0].st);
	}
	else if(file < 2.0){
		tex = texture2D(tex2,gl_TexCoord[0].st);
	}
	else if(file < 3.0){
		tex = texture2D(tex3,gl_TexCoord[0].st);
	}
	else{
		tex = texture2D(tex4,gl_TexCoord[0].st);
	}
	
	gl_FragColor = tex;
}
