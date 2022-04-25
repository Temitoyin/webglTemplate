//color
uniform vec2 u_hover;
// uniform vec2 u_resolution;

// uniform float time;
// varying float vNoise;
// vec3 yellow, magenta, green;
// vec3 colorA = vec3(0.149,0.141,0.912);
// vec3 colorB = vec3(1.000,0.833,0.224);


// void main() {
//         vec2 st = gl_FragCoord.xy/(u_resolution.xy);
//         vec3 color = vec3(0.0);

//     // float pct = abs(sin(time/20.));
//         vec3 pct = vec3(st.x);

//     // float x = smoothstep(0.2,0.3, time);

//     color = mix(colorA, colorB, pct);

//     gl_FragColor = vec4(color, 1.0);
// }


// Color from the center
// #define TWO_PI 6.28318530718

// uniform vec2 u_resolution;
// uniform float time;

// //  Function from Iñigo Quiles
// //  https://www.shadertoy.com/view/MsS3Wc
// vec3 hsb2rgb( in vec3 c ){
//     vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
//                              6.0)-3.0)-1.0,
//                      0.0,
//                      1.0 );
//     rgb = rgb*rgb*(3.0-2.0*rgb);
//     return c.z * mix( vec3(1.0), rgb, c.y);
// }

// void main(){
//     vec2 st = gl_FragCoord.xy/u_resolution;
//     vec3 color = vec3(0.0);

//     // Use polar coordinates instead of cartesian
//     vec2 toCenter = vec2(0.5)-st;
//     float angle = atan(toCenter.y,toCenter.x);
//     float radius = length(toCenter)*2.0;

//     // Map the angle (-PI to PI) to the Hue (from 0 to 1)
//     // and the Saturation to the radius
//     color = hsb2rgb(vec3((angle/TWO_PI)+0.5,radius,1.0));

//     gl_FragColor = vec4(color,1.0);
// }

// Shapes

// #ifdef GL_ES
// precision mediump float;
// #endif

// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float u_time;
// varying vec2 vUv; 


// void main(){
// vec2 st = gl_FragCoord.xy/u_resolution.xy;
// vec2 newUV = vUv;
//     vec3 color = vec3(0.0);
//     float dist = distance(newUV, vec2(0.5));

//     vec2 pos = vec2(0.3)-dist;

//     float r = length(pos)*2.0;
//     float a = atan(pos.y,pos.x);

//     float f = cos(a*2.);
//     // f = abs(cos(a*3.));
//     // f = abs(cos(a*2.5))*.5+.3;
//     // f = abs(cos(a*12.)*sin(a*3.))*.8+.1;
//     // f = smoothstep(-.5,1., cos(a*10.))*0.2+0.5;

//     color = vec3( 1.-smoothstep(f,f+0.02,r) );

//     // gl_FragColor = vec4(color, 1.0);
//   // Visualize the distance field
// //   gl_FragColor = vec4(vec3(fract(dist*10.0)),1.0);

//   // Drawing with the distance field
//   // gl_FragColor = vec4(vec3( step(.3,d) ),1.0);
//   // gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
//   gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
// }

//Matrix
// Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

// #ifdef GL_ES
// precision mediump float;
// #endif

// uniform vec2 u_resolution;
// uniform float time;

// float box(in vec2 _st, in vec2 _size){
//     _size = vec2(0.5) - _size*0.5;
//     vec2 uv = smoothstep(_size,
//                         _size+vec2(0.001),
//                         _st);
//     uv *= smoothstep(_size,
//                     _size+vec2(0.001),
//                     vec2(1.0)-_st);
//     return uv.x*uv.y;
// }

// float cross(in vec2 _st, float _size){
//     return  box(_st, vec2(_size,_size/4.)) +
//             box(_st, vec2(_size/4.,_size));
// }

// void main(){
//     vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     vec3 color = vec3(0.0);

//     // To move the cross we move the space
//     vec2 translate = vec2(cos(time/10.),exp(sin(time/10.)));
//     st += translate*0.35;

//     // Show the coordinates of the space on the background
//     color = vec3(st.x,st.y,0.0);

//     // Add the shape on the foreground
//     color += vec3(cross(st,0.25));

//     gl_FragColor = vec4(color,1.0);
// }

// Rotation
// #ifdef GL_ES
// precision mediump float;
// #endif

// #define PI 3.14159265359

// uniform vec2 u_resolution;
// uniform float time;

// mat2 rotate2d(float _angle){
//     return mat2(cos(_angle),-sin(_angle),
//                 sin(_angle),cos(_angle));
// }

// float box(in vec2 _st, in vec2 _size){
//     _size = vec2(0.5) - _size*0.5;
//     vec2 uv = smoothstep(_size,
//                         _size+vec2(0.001),
//                         _st);
//     uv *= smoothstep(_size,
//                     _size+vec2(0.001),
//                     vec2(1.0)-_st);
//     return uv.x*uv.y;
// }

// float cross(in vec2 _st, float _size){
//     return  box(_st, vec2(_size,_size/4.)) +
//             box(_st, vec2(_size/4.,_size));
// }

// void main(){
//     vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     vec3 color = vec3(0.0);

//     // move space from the center to the vec2(0.0)
//     st -= vec2(0.5);
//     // rotate the space
//     st = rotate2d( sin(time/13.)*PI ) * st;
//     // move it back to the original place
//     st += vec2(0.5);

//     // Show the coordinates of the space on the background
//     // color = vec3(st.x,st.y,0.0);

//     // Add the shape on the foreground
//     color += vec3(cross(st,0.4));

//     gl_FragColor = vec4(color,1.0);
// }

// Scale 
#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float time;

mat2 scale(vec2 _scale){
    return mat2(_scale.x,0.0,
                0.0,_scale.y);
}

float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

float cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    st -= vec2(0.5);
    st = scale( vec2(sin(time/10.)+1.0) ) * st;
    st += vec2(0.5);

    // Show the coordinates of the space on the background
    // color = vec3(st.x,st.y,0.0);

    // Add the shape on the foreground
    color += vec3(cross(st,0.2));

    gl_FragColor = vec4(color,1.0);
}