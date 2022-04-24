// //color
// uniform vec2 u_hover;
// // uniform vec2 u_resolution;

// // uniform float time;
// // varying float vNoise;
// // vec3 yellow, magenta, green;
// // vec3 colorA = vec3(0.149,0.141,0.912);
// // vec3 colorB = vec3(1.000,0.833,0.224);


// // void main() {
// //         vec2 st = gl_FragCoord.xy/(u_resolution.xy);
// //         vec3 color = vec3(0.0);

// //     // float pct = abs(sin(time/20.));
// //         vec3 pct = vec3(st.x);

// //     // float x = smoothstep(0.2,0.3, time);

// //     color = mix(colorA, colorB, pct);

// //     gl_FragColor = vec4(color, 1.0);
// // }


// // Color from the center
// // #define TWO_PI 6.28318530718

// // uniform vec2 u_resolution;
// // uniform float time;

// // //  Function from Iñigo Quiles
// // //  https://www.shadertoy.com/view/MsS3Wc
// // vec3 hsb2rgb( in vec3 c ){
// //     vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
// //                              6.0)-3.0)-1.0,
// //                      0.0,
// //                      1.0 );
// //     rgb = rgb*rgb*(3.0-2.0*rgb);
// //     return c.z * mix( vec3(1.0), rgb, c.y);
// // }

// // void main(){
// //     vec2 st = gl_FragCoord.xy/u_resolution;
// //     vec3 color = vec3(0.0);

// //     // Use polar coordinates instead of cartesian
// //     vec2 toCenter = vec2(0.5)-st;
// //     float angle = atan(toCenter.y,toCenter.x);
// //     float radius = length(toCenter)*2.0;

// //     // Map the angle (-PI to PI) to the Hue (from 0 to 1)
// //     // and the Saturation to the radius
// //     color = hsb2rgb(vec3((angle/TWO_PI)+0.5,radius,1.0));

// //     gl_FragColor = vec4(color,1.0);
// // }

// // Shapes

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

//     gl_FragColor = vec4(color, 1.0);
//   // Visualize the distance field
// //   gl_FragColor = vec4(vec3(fract(dist*10.0)),1.0);

//   // Drawing with the distance field
//   // gl_FragColor = vec4(vec3( step(.3,d) ),1.0);
//   // gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
//   // gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
// }




// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float u_time;

// float plot(vec2 st, float pct){
//   return  smoothstep( pct-0.02, pct, st.y) -
//           smoothstep( pct, pct+0.02, st.y);
// }

// void main() {
//     vec2 st = gl_FragCoord.xy/u_resolution;

//     // Smooth interpolation between 0.1 and 0.9
// float y = smoothstep(0.2,0.5,st.x) - smoothstep(0.5,0.8,st.x);

//     vec3 color = vec3(y);

//     float pct = plot(st,y);
//     color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

//     gl_FragColor = vec4(color,1.0);
// }

// precision mediump float;

// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float time;

// vec3 colorA = vec3(1.,0.51,0.412);
// vec3 colorB = vec3(0.8,0.733,0.124);

// float plot (vec2 st, float pct){
//   return  smoothstep( pct-0.01, pct, st.y) -
//           smoothstep( pct, pct+0.01, st.y);
// }

// void main() {
//     vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     vec3 color = vec3(0.0);

//     // vec3 pct = vec3(st.x);

//     // pct.r = smoothstep(0.0,1.0, st.x);
//     // pct.g = sin(st.x*3.14159265359);
//     // pct.b = pow(st.x,0.5);
// float pct = sin(time/5.);
//     color = mix(colorA, colorB, pct);

//     // Plot transition lines for each channel
//     // color = mix(color,vec3(1.0,0.0,0.0),plot(st,pct.r));
//     // color = mix(color,vec3(0.0,1.0,0.0),plot(st,pct.g));
//     // color = mix(color,vec3(0.0,0.0,1.0),plot(st,pct.b));

//     gl_FragColor = vec4(color,1.0);
// }

#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform float time;

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix( vec3(1.0), rgb, c.y);
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution;
    vec3 color = vec3(0.0);

    // Use polar coordinates instead of cartesian
    vec2 toCenter = vec2(0.5)-st;
    float angle = atan(toCenter.y,toCenter.x);
    float radius = length(toCenter)*2.0;

    // Map the angle (-PI to PI) to the Hue (from 0 to 1)
    // and the Saturation to the radius
    color = hsb2rgb(vec3((angle/TWO_PI)+0.5,radius,1.0) *time/10.);

    gl_FragColor = vec4(color,1.0);
}
