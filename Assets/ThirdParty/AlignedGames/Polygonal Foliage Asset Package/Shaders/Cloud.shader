Shader "Custom/Cloud" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
        _MainAlpha ("Main Alpha", Range(0.0,1.0)) = 1.0
        _RimColor ("Rim Color", Color) = (0.26,0.19,0.16,0.0)
        _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0
    }
   
    SubShader {
       
            Tags { "Queue"="Transparent" "RenderType"="Transparent" }
           
            CGPROGRAM
           
            #pragma surface surf Lambert alpha
           
            struct Input {
                float3 _Color;
                float3 viewDir;
            };
           
            float4 _Color;
            float4 _RimColor;
            float _RimPower;
            float _MainAlpha;
           
            void surf (Input IN, inout SurfaceOutput o) {
               
                o.Albedo = _Color;
               
                half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
                o.Emission = _RimColor.rgb * pow (rim, _RimPower);
               
                o.Alpha = _MainAlpha;
            }
           
            ENDCG
           
    }
   
    FallBack "Diffuse"
}
 