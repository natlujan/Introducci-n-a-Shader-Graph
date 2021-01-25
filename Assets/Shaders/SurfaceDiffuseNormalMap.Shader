Shader "Custom/SurfaceDiffuseNormalMap"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        _MainTex("Main Texture", 20) = "white" {}
        _BumpMap("Normal Map", 20) = "bump" {}
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM

            half4 _Albedo;
            sampler2D _MainTex;
            sampler2D _BumpMap;

            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
                float2 uv_BumpMap;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                half4 texColor = tex2d(_MainTex, IN.uv_MainTex);
                half4 texColor = tex2d(_BumpMap, IN.uv_BumpMap);

                o.Albedo = texColor.rgb * _Albedo;
                o.Normal = UnpackNormal(bumpColor)
            }
        ENDCG
    }
}