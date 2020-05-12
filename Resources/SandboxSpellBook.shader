shader_type canvas_item;



void fragment() {
	
	float waveStrength = 0.02;
    float frequency = 30.0;
    float waveSpeed = 5.0;
    vec4 sunlightColor = vec4(0.45,0.75,0.91, 1.0);
    float sunlightStrength = 5.0;
    float centerLight = 2.;
    float oblique = .25; 
        
    vec2 tapPoint = vec2(0.5,0.5);
	vec2 iResolution = 1.0/SCREEN_PIXEL_SIZE;
    vec2 uv = FRAGCOORD.xy / iResolution.xy;
    float modifiedTime = TIME * waveSpeed;
    float aspectRatio = iResolution.x/iResolution.y;
    vec2 distVec = uv - tapPoint;
    distVec.x *= aspectRatio;
    float distance = length(distVec);
    
    float multiplier = (distance < 1.0) ? ((distance-1.0)*(distance-1.0)) : 0.0;
    float addend = (sin(frequency*distance-modifiedTime)+centerLight) * waveStrength * multiplier;
    vec2 newTexCoord = uv + addend*oblique;    
    
    vec4 colorToAdd = sunlightColor * sunlightStrength * addend;
    
	COLOR = texture(SCREEN_TEXTURE, newTexCoord) + colorToAdd-vec4(0.2,0.2,0.15,0.0);
	
	//vec2 coord = SCREEN_UV;

	//vec4 texturita = texture(SCREEN_TEXTURE, coord);

	//COLOR = texturita;
}