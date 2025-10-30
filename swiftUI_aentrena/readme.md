##  Marvel Heroes

### ¿Qué es Marvel Heroes?
Marvel Heroes es una aplicación iOS desarrollada en Swift y SwiftUI que consume la API oficial de Marvel para mostrar un listado de héroes y las series en las que han aparecido.
Su objetivo es practicar el consumo de APIs, la asincronía en SwiftUI y la aplicación de patrones de arquitectura modernos.

### Objetivos del proyecto

El proyecto se centra en aplicar buenas prácticas de desarrollo en iOS moderno, destacando:

	1.	Consumo de API REST: integración con la API pública de Marvel usando claves privadas y públicas.

	2.	Arquitectura MVVM: separación clara entre la capa de presentación y la lógica de negocio.

	3.	Patrón Repositorio: abstracción de las fuentes de datos para facilitar escalabilidad y testing.

	4.	UI declarativa: interfaz creada con SwiftUI, permitiendo un flujo reactivo y limpio.

### ¿Cómo funciona?

1.	Al abrir la app se muestra un listado de héroes obtenidos desde la API de Marvel.

2.	Puedes buscar o seleccionar un héroe para acceder a su pantalla de detalle.

3.	En el detalle, verás las series en las que ha participado, con su imagen y descripción.

### Tecnologías utilizadas 

- Lenguaje: Swift 

- Framework principal: SwiftUI 	

- Arquitectura: MVVM (Model-View-ViewModel) + Patrón repositorio.

- Network: URLSession con gestión de asincronía y decodificación JSON.

- API: Marvel Developer API

### Clona el repositorio 

```git clone https://github.com/tu_usuario/marvel-heroes.git ``

