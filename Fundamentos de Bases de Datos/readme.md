# Fundamentos de Bases de Datos

## Conceptos básicos y contexto histórico de las bases de datos

## Introducción a las bases de datos relacionales
### Historia de las RDB


### Entidades y atributos
Una entidad es una representación de la vida real, algo similar a los objetos en programación; los atributos son las características que hacen lo hacen ser una entidad. Una entidad puede tener atributos multivaluados, es decir, aquellos atributos que pueden ser más de uno, entiéndase, las llantas de un carro. A los atributos que están formados a su vez de otros atributos, se les llama atributos compuestos (por ejemplo, un atributo de un carro puede ser su motor, el cual a su vez, está formado por otros atributos).

Existen dos tipos de entidades:

- Entidades fuertes: no dependen de otra entidad para existir.
- Entidad débiles: dependen de otra entidad para existir (por ejemplo, en una biblioteca no se puede tener el ejemplar de un libro que no existe). Una entidad puede ser débil por identidad, es decir, la entidad débil depende del identificador de la entidad fuerte a la que está relacionada; una entidad también puede ser débil por cantidad, es decir, se le asigna un identificador único a la entidad, y aunque ésta tiene su propio identificador, no podría existir sin la existencia de una entidad fuerte.

### Relaciones
Las relaciones es la manera en las que se ligan las entidades u objetos; las relaciones por convención se nombran con verbos. Podemos, por ejemplo, relacionar las entidades «Jugadores» y «Equipos» mediante la relación «pertenece», es decir, un jugador pertence a un equipo.

La cardinalidad se refiere a la cantidad de las relaciones entre entidades, es decir, cuántas de un lado y cuántas del otro; existen varios tipos de cardinalidad:

- Cardinalidad 1 a 1
- Cardinalidad 0 a 1 o 1 a 1 opcional
- Cardinalidad 1 a N
- Cardinalidad 0 a N o 1 a N opcional

### Múltiples muchos
Es un tipo de cardinalidad especial, es una cardinalidad N a N, es decir, muchos a muchos. Por ejemplo, la entidad «Alumnos» puede pertenecer a «Clases» y también, una entidad «Clases» puede contener muchas entidades «Alumnos».

### Diagrama físico: tipos de datos y constraints
El siguiente paso al diagrama entidad-relación es el diagrama físico; primero veamos los tipos de datos:

| Texto      | Números       | Fecha/Hora | Lógicos |
|------------|---------------|------------|---------|
| CHAR(n)    | INTEGER       | DATE       | BOOLEAN |
| VARCHAR(n) | BIGINT        | TIME       |         |
| TEXT       | SMALLINT      | DATETIME   |         |
|            | DECIMAL(n, s) | TIMESTAMP  |         |
|            | NUMERIC(n, s) |            |         |

Otra cosa fundamental para la creación de un diagrama físico son los constraints (restricciones):

| Constraint  | Descripción                                                     |
|-------------|-----------------------------------------------------------------|
| NOT NULL    | Se asegura que la columna no tenga valores nulos                |
| UNIQUE      | Se asegura que cada valor en la columna no se repita            |
| PRIMARY KEY | Es una combinación de NOT NULL y UNIQUE                         |
| FOREING KEY | Identifica de manera única una tupla en otra tabla              |
| CHECK       | Se asegura que el valor en la columna cumpla una condición dada |
| DEFAULT     | Coloca un valor por defecto cuando no hay un valor especificado |
| INDEX       | Se crea por la columna para permitir búsquedas más rápidas      |

### Diagrama físico: normalización
La normalización como su nombre lo indica,nos ayuda a dejar todo en una forma normal. Observemos la siguiente tabla:

| alumno | nivel_curso  | nombre_curso     | materia_1 | materia_2 |
|--------|--------------|------------------|-----------|-----------|
| Jan    | Maestría     | Data Engineering | MySQL     | Python    |
| José   | Licenciatura | Programación     | MYSQL     | Python    |

- Primera forma normal (1FN): Atributos atómicos, es decir, sin campos repetidos. Aplicando la primera forma normal a nuestra tabla, el resultado es el siguiente.

| alumnos   |        |              |                  |         |
|-----------|--------|--------------|------------------|---------|
| alumno_id | alumno | nivel_curso  | nombre_curso     | materia |
| 1         | Jan    | Maestría     | Data Engineering | MySQL   |
| 1         | Jan    | Maestría     | Data Engineering | Python  |
| 2         | José   | Licenciatura | Programación     | MySQL   |
| 2         | José   | Licenciatura | Programación     | Python  |

- Segunda forma normal (2FN): Cumple 1FN y cada campo de la tabla debe depender de una clave única. La segunda regla nos indica la separación de nuestra tabla. La razón de la separación es que conceptualmente los alumnos y las materias son dos cosas totalmente distintas.

| alumnos   |        |              |                  |
|-----------|--------|--------------|------------------|
| alumno_id | alumno | nivel_curso  | nombre_curso     |
| 1         | Jan    | Maestría     | Data Engineering |
| 1         | Jan    | Maestría     | Data Engineering |
| 2         | José   | Licenciatura | Programación     |
| 2         | José   | Licenciatura | Programación     |

| materias   |           |         |
|------------|-----------|---------|
| materia_id | alumno_id | materia |
| 1          | 1         | MySQL   |
| 2          | 1         | Python  |
| 3          | 2         | MySQL   |
| 4          | 2         | Python  |

- Tercera forma normal (3FN): Cumple 1FN y 2FN y los campos que NO son clave NO deben tener dependencias. Jan no tiene intrínsecamente ligada la maestría, por lo tanto se puede manejar como una entidad distinta.

| alumnos   |        |           |
|-----------|--------|-----------|
| alumno_id | alumno | curso_id  |
| 1         | Jan    | 1         |
| 1         | Jan    | 2         |

| cursos   |              |                  |
|----------|--------------|------------------|
| curso_id | nivel_curso  | nombre_curso     |
| 1        | Maestría     | Data Engineering |
| 1        | Licenciatura | Programación     |

| materias   |           |         |
|------------|-----------|---------|
| materia_id | alumno_id | materia |
| 1          | 1         | MySQL   |
| 2          | 1         | Python  |
| 3          | 2         | MySQL   |
| 4          | 2         | Python  |

- Cuarta forma normal (4FN): Cumple 1FN, 2FN y 3FN; los campos multivaluados se identifican por una clave única.

| alumnos   |        |           |
|-----------|--------|-----------|
| alumno_id | alumno | curso_id  |
| 1         | Jan    | 1         |
| 1         | Jan    | 2         |

| cursos   |              |                  |
|----------|--------------|------------------|
| curso_id | nivel_curso  | nombre_curso     |
| 1        | Maestría     | Data Engineering |
| 1        | Licenciatura | Programación     |

| materias   |         |
|------------|---------|
| materia_id | materia |
| 1          | MySQL   |
| 2          | Python  |
| 3          | MySQL   |
| 4          | Python  |

| materia_por_alumno |            |           |
|--------------------|------------|-----------|
| mpa_id             | materia_id | alumno_id |
| 1                  | 1          | 1         |
| 2                  | 2          | 1         |
| 3                  | 1          | 2         |
| 4                  | 2          | 2         |
