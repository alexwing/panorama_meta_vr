# Panorama Unity Shader

This is a Unity project that demonstrates how to create a panorama shader in Unity. 

The shader is designed to render 360-degree panoramic images in a Universal Render Pipeline (URP) environment. It uses equirectangular projection to map the image onto a sphere, creating a realistic 360-degree view.

[![Panorama Unity Shader](https://img.youtube.com/vi/PgvoehiU_tQ/0.jpg)](https://www.youtube.com/watch?v=PgvoehiU_tQ)

## How to use

1. Open the project in Unity.
2. Open the `Panorama` scene.
3. Select the `PanoSphere` for 360-degree use the mesh SphereHD, for 180-degree use the mesh SphereHD180.
4. Assign a 360-degree panoramic image to the `Panorama -> PanoSphere -> Material`.
5. Run the scene.

## Shader Explanation

This shader, named "Unlit/Pano360ShaderURP", is a custom shader for Unity used for rendering 360 panoramic images in a Universal Render Pipeline (URP) environment.

The shader takes a 360-degree panoramic image and maps it onto a sphere. The image is projected onto the sphere using a technique called equirectangular projection. This projection maps the latitude and longitude of the image onto a 2D plane, which can then be mapped onto a sphere.

**Parameters:**

- `_MainTex`: This is the main texture applied to the object. By default, it's white.
- `_Color`: This is the main color of the shader. By default, it's white with 50% transparency.
- `_VOFFSET`: This is the vertical offset of the texture. It can range from -180 to 180.
- `_HAOV`: This is the horizontal angle of view. It can range from 0 to 100.
- `_VAOV`: This is the vertical angle of view. It can range from 1 to 100.
- `_ALPHABACK`: This is the transparency of the background. It can range from 0 to 1.
- `_HOffset`: This is the horizontal offset of the texture. It can range from -180 to 180.

**Operation:**

The shader has two passes. In the first pass, only the back faces of the object are rendered. In the second pass, only the front faces are rendered.

In each pass, two functions are executed: `vert` and `frag`.

- `vert`: This function is executed for each vertex of the object. It transforms the vertex position from object space to homogeneous clip space.

- `frag`: This function is executed for each pixel of the object. It calculates the texture coordinates (uv) based on the vertex normal. Then, it applies the texture and color to the pixel. If the uv coordinates are outside the range [0, 1], the background color is applied.


## Other shaders versions

- `Pano360ShaderURPMobile`: This shader is a simplified version of the Pano360ShaderURP shader, optimized for mobile devices. Use half not float for the parameters.
- `Pano360Shader3D`: This shader is a 3D version of the Pano360ShaderURP shader, use two images for left and right eyes.
- `Pano360ShaderDepthMap`: This shader is a version of the Pano360ShaderURP shader, use a depth map for 3d effect.

## Considerations

The examples images are from [Jean Laurent](https://mappuzzle.xyz/sevilla360/), not included in the project repository, for space reasons.

Can you use other images, but you need to adjust the parameters of the shader.

## Credits

This project was created by [Alejandro Aranda](https://aaranda.es)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

