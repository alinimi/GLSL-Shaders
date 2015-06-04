// simple vertex shader

uniform vec2 Min;
uniform vec2 Max;
void main()
{
	vec2 coords = gl_MultiTexCoord0.st;

	coords.x = 2*(coords.x - Min.x)/(Max.x-Min.x)-1.0;
	coords.y = 2*(coords.y - Min.y)/(Max.y-Min.y)-1.0;
	gl_Position    = vec4(coords.x,coords.y,1.0,1.0);
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
