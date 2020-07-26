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
