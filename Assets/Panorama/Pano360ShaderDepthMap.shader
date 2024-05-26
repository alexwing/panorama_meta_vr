Shader "Unlit/Pano360ShaderDepthMap"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _DepthMap ("Depth Map (R)", 2D) = "white" {}
        _Color ("Main Color", Color) = (1,1,1,0.5)
        _VOFFSET ("Vertical Offset", Range(-180, 180)) = 0
        _HAOV ("Horizontal Angle of View", Range(0, 100)) = 1
        _VAOV ("Vertical Angle of View", Range(1, 100)) = 1
        _ALPHABACK ("Alpha Background", Range(0, 1)) = 0
        _HOffset ("Horizontal Offset", Range(-180, 180)) = 0
        _DEPTHOFFSET ("Depth Offset", Range(-0.001, 0.1)) = 0.005
    }

    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            
            struct Attributes
            {
                float4 positionOS   : POSITION;
                float3 normal       : NORMAL;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct Varyings
            {
                float4 positionHCS  : SV_POSITION;
                float3 normal       : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            sampler2D _MainTex;
            sampler2D _DepthMap;
            float4 _MainTex_ST;
            float4 _Color;
            float _VOFFSET;
            float _HAOV;
            float _VAOV;
            float _ALPHABACK;
            float _HOffset;
            float _DEPTHOFFSET;
            
            Varyings vert(Attributes input)
            {
                Varyings output;
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
                output.positionHCS = TransformObjectToHClip(input.positionOS.xyz);
                output.normal = input.normal;
                return output;
            }
            
            half4 frag(Varyings input) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);
                float2 uv = float2(atan2(input.normal.z, input.normal.x) / (2.0 * 3.14159) + 0.5, asin(input.normal.y) / 3.14159 + 0.5);
                uv.x = -(uv.x - 0.5) * (_HAOV/10) + 0.5 + _HOffset / 180.0;
                uv.y = (uv.y - 0.5) * (_VAOV/10) + 0.5 - _VOFFSET / 180.0;
                if (uv.x < 0 || uv.x > 1 || uv.y < 0 || uv.y > 1)
                    return half4(0, 0, 0, _ALPHABACK); // Color de fondo
                half depth = tex2D(_DepthMap, uv).r;
                uv += depth * (unity_StereoEyeIndex == 0 ? -_DEPTHOFFSET : _DEPTHOFFSET); // Ajusta la deformación aquí
                half4 col = tex2D(_MainTex, uv);
                col.a = _Color.a;
                col.rgb *= _Color.rgb;
                return col;
            }
            ENDHLSL
            Cull Front // Renderiza solo las caras traseras
        }
    }
}