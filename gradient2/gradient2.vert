// simple vertex shader
uniform int minY;
uniform int maxY;

vec4 red = vec4(1.0,0.0,0.0,1.0);
vec4 green = vec4(0.0,1.0,0.0,1.0);
vec4 blue = vec4(0.0,0.0,1.0,1.0);
vec4 yellow = vec4(1.0,1.0,0.0,1.0);
vec4 cyan = vec4(0.0,1.0,1.0,1.0);
void main()
{
	vec4 vert = gl_ModelViewProjectionMatrix*gl_Vertex;
	
	
	gl_Position    = vert;
	float normY = (vert.y-minY)/((maxY-minY)/4.0);
	vec4 color;
	if(normY <= 1.0){
		color = mix(red,yellow,normY);
	}
	else if(normY <= 2.0){
		color = mix(yellow,green,normY-1);
	}
	else if(normY <= 3.0){
		color = mix(green,cyan,normY-2);
	}
	else{
		color = mix(cyan,blue,normY-3);
	}
	gl_FrontColor  = color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
