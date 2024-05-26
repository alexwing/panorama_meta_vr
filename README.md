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


## Panorama Jean Laurent

Conversión de foto 360º de las fotos tomadas por Jean Laurent, el fotógrafo francés afincado en España que tomó 7 instantáneas para formar un gran panorama del río y sus alrededores.

Jean Laurent fue un fotógrafo francés que se estableció en España en 1843. En 1856, Laurent abrió un estudio en Madrid, que se convirtió en uno de los más importantes de la ciudad. Laurent fue uno de los primeros fotógrafos en utilizar la técnica del estereoscopio en España. Laurent fue uno de los fotógrafos más prolíficos de España en el siglo XIX. Su obra abarca una amplia gama de temas, incluyendo retratos, vistas de ciudades y paisajes, y fotografías de arquitectura y arte. Laurent fue uno de los primeros fotógrafos en documentar la arquitectura y el paisaje de España, y su obra es una fuente importante para el estudio de la historia y la cultura españolas del siglo XIX.

Con respecto a esta panorámica, El fotógrafo francés tomó 7 instantáneas para formar un gran panorama del río y sus alrededores. Las fotos originales fueron tomadas posiblemente en 1886 y muestran una vista panorámica de la ciudad desde el río Guadalquivir tomadas desde la actual calle Betis, probablemente desde el tejado o terraza de una casa, incluye los barcos en el puerto, los edificios y las calles de la ciudad, y el paisaje circundante. El tiempo de exposición de la fotografía era muy largo, así que por ejemplo vemos a una persona en dos posiciones: mirando al fotógrafo y contemplando el río. Da así la sensación de que vemos una fantasmagoría. Es un fabuloso viaje al pasado.

Para unir las fotos y formar la panorámica, sorprendetemente las imágenes estaban correctamente alineadas, por lo que no fue necesario realizar muchos ajustes, solo eliminar imperfecciones, polvo y arañazos que existían en las fotos originales, Jean Laurent fue un fotógrafo excepcional y sus fotos estaban tomadas con gran precisión. Aunque para ser sinceros, la versión final que estoy utilizando no es la que yo junte, sino una versión que me suministro Javier Marquéz compañero cuando trabajaba en Cyan Animatica, que ya había realizado la unión de las fotos y había eliminado las imperfecciones desde una versión de mayor calidad que la que yo tenía.

Para colorear la foto, se dividió en pequeñas secciones y se colorearon usando diferentes herramientas de inteligencia artificial, luego se unieron para formar la imagen final, se ajustó y colorearón algunas partes de manera manual, luego se añadió un cielo creíble. Alguna de estas herramientas son palette.fm,hotpot.ai, 9may.mail.ru/restoration, etc.

Para la parte inferior se han utilizando diferentes herramientas de inteligencia artificial: freepick (upscaler, reimagine) y magnific.ai. Primero se realizaron bocetos burdos y se fueron pasando varias veces por los diferentes programas de inteligencia artificial para que fueran más realistas, luego se le aplico superresolución para que tuviera una mayor calidad. Hay que tener que en cuenta que esta recreación de la parte inferior es una interpretación, que podría no ser exacta, las dos imagenes de abajo son vistas de la calle Betis en la misma época, he intentado darle un aspecto parecido pero no es algo que deba tomarse como una representación realista. 


## LinkedIn publicación en español

Después de crear el panorama de Jean Laurent, https://mappuzzle.xyz/sevilla360/ me picó la curiosidad de como se vería en VR, así que decidí crear un pequeño proyecto en Unity para poder visualizarlo en VR, y de paso, he creado un Shader desde cero para poder visualizar panoramas en 360º en Unity, con ayuda de Copilot eso si, pero ha sido una experiencia muy interesante.

Además he probado la ultima version del kit de desarrollo de Meta Quest, que por fin empieza a incluir oclusión de las manos, aunque todavía no es perfecto, es un gran avance.

Os dejo un pequeño video de como se ve en VR, espero que os guste.

#unity #vr #panorama #jeanlaurent #sevilla #metaquest #shader #360 #panorama360 #panorama180


## Twitter post

Después de crear el panorama de Jean Laurent, https://mappuzzle.xyz/sevilla360/ me picó la curiosidad de como se vería en VR, así que decidí crear un pequeño proyecto en Unity para poder visualizarlo en VR, y de paso, he creado un Shader desde cero para poder visualizar panoramas en 360º en Unity, con ayuda de Copilot eso si, pero ha sido una experiencia muy interesante.

## LinkedIn publicación en inglés

After creating the panorama of Jean Laurent, https://mappuzzle.xyz/sevilla360/ I was curious about how it would look in VR, so I decided to create a small project in Unity to be able to visualize it in VR, and by the way, I have created a Shader from scratch to be able to visualize 360º panoramas in Unity, with the help of Copilot that is, but it has been a very interesting experience.

I have also tried the latest version of the Meta Quest development kit, which finally begins to include hand occlusion, although it is still not perfect, it is a great advance.

I leave you a small video of how it looks in VR, I hope you like it.

#unity #vr #panorama #jeanlaurent #sevilla #metaquest #shader #360 #panorama360 #panorama180





