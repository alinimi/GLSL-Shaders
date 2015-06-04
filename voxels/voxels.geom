// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

uniform float time;
uniform float step;

void main( void )
{
	vec3 b = vec3(0.0,0.0,0.0);
	for(int i = 0; i < gl_VerticesIn; ++i){
		b += gl_PositionIn[i].xyz;
	}
	b = b/3.0;
	float h = step/2.0;
	b.x = b.x - mod(b.x,step)+((abs(mod(b.x,step))>h)?step:0.0);
	b.y = b.y - mod(b.y,step)+((abs(mod(b.y,step))>h)?step:0.0);
	b.z = b.z - mod(b.z,step)+((abs(mod(b.z,step))>h)?step:0.0);

	vec3 v = normalize(b);
	vec3 a = vec3(0.0,-1.0,0.0);
	b = b+v*time+a*pow(time,2)/2;

	vec4 vx[8];
	vx[0] = vec4(b.x-h,b.y-h,b.z-h,1.0);
	vx[1] = vec4(b.x-h,b.y-h,b.z+h,1.0);
	vx[2] = vec4(b.x-h,b.y+h,b.z-h,1.0);
	vx[3] = vec4(b.x-h,b.y+h,b.z+h,1.0);
	vx[4] = vec4(b.x+h,b.y-h,b.z-h,1.0);
	vx[5] = vec4(b.x+h,b.y-h,b.z+h,1.0);
	vx[6] = vec4(b.x+h,b.y+h,b.z-h,1.0);
	vx[7] = vec4(b.x+h,b.y+h,b.z+h,1.0);
	vec3 Nf = vx[0].xyz*vx[1].xyz*vx[2].xyz;
	vec3 N2 = vx[4].xyz*vx[5].xyz*vx[6].xyz;
	vec3 N3 = vx[0].xyz*vx[2].xyz*vx[4].xyz;
	vec3 N4 = vx[1].xyz*vx[3].xyz*vx[5].xyz;
	vec3 N5 = vx[0].xyz*vx[1].xyz*vx[4].xyz;
	for(int i = 0; i< 8; ++i){
		vx[i] = gl_ModelViewProjectionMatrix*vx[i];
	}
	
	
	for(int i = 0; i< 4; i++){
		gl_FrontColor  = vec4(Nf.z,Nf.z,Nf.z,1.0);
		gl_Position    = vx  [ i ];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
	for(int i = 4; i< 8; i++){
		gl_FrontColor  = vec4(N2.z,N2.z,N2.z,1.0);
		gl_Position    = vx  [ i ];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
	for(int i = 0; i< 8; i+=2){
		gl_FrontColor  = vec4(N3.z,N3.z,N3.z,1.0);
		gl_Position    = vx  [ i ];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
	for(int i = 1; i< 8; i+=2){
		gl_FrontColor  = vec4(N4.z,N4.z,N4.z,1.0);
		gl_Position    = vx  [ i ];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
	int[4] verts= int[4](0,1,4,5);
	for(int i = 0; i< 4; i+=1){
		gl_FrontColor  = vec4(N5.z,N5.z,N5.z,1.0);
		gl_Position    = vx  [ verts[i] ];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
	for(int i = 0; i< 4; i+=1){
		gl_FrontColor  = vec4(1.0,1.0,1.0,1.0);
		int j = verts[i]+2;
		gl_Position    = vx  [j];
		gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
		EmitVertex();

	}
	EndPrimitive();
}
