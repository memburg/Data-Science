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

## RDBMS
Relational Database Management System, es un un sistema que permite crear, editar y administrar una base de datos relacional. En su gran mayoría usan el Lenguaje de Consultas Estructuradas (SQL).

## SQL
### Historia de SQL
Structured Query Language, se crea con la idea de hacer consultas a bases de datos con un lenguaje estandarizado y que pudiese ser usado independientemente del manejador de bases de datos.

### DDL
Data Definition Language, es un lenguaje que nos ayuda a crear la estructura de una base de datos. Existen tres grandes comandos: 
- `create`: nos ayuda a crear tablas, vistas, índices, etc.
- `alter`: nos ayuda a alterar o modificar alguna de las entidades mencionadas.
- `drop`: nos ayuda a borrar.

Para el comando `create` tenemos tres grandes grupos:
- Bases de datos: repositorio de datos que usa un proyecto.
- Tablas: son la proyección de las entidades.
- Vistas: la proyección de la base de datos de una forma entendible.

### DDL VIEW y DDL ALTER
Una vista es un concepto útil que sirven para tomar datos de la base de datos, ponerlas en una forma presentable y permite que se consulte de manera recurrente. A continuación se muestra un ejemplo de la creación de una vista:

```mysql
CRETE VIEW v_brasil_customers AS
    SELECT customer_name, contact_name
    FROM customers
    WHERE country = "Brasil";
```

`ALTER` nos permite modificar nuestra base de datos. A continuación se muestra un ejemplo del uso de `ALTER`:

```mysql
ALTER TABLE people
ADD date_of_birth date;

ALTER TABLE people
ALTER COLUMN date_of_birth year;

ALTER TABLE people
DROP COLUMN date_of_birth;
```

### DDL DROP
Se trata de una de las sentencias más peligrosas de SQL, permite la eliminación de lo que se le indica, veamos un ejemplo:

```mysql
DROP TABLE people;

DROP DATABASE test_db;
```

### DML
Data Manipulation Language, maneja el contenido de la base de datos. Existen cuatro grandes comandos:

- `insert`: permite insertar un nuevo registro o tupla a la base de datos. A continuación se muestra un ejemplo:

```mysql
INSERT INTO people (last_name, first_name, address, city)

VALUES ('Hernández', 'Laura', 'Calle 21', 'Monterrey'),
VALUES ('Guerrero', 'Alfonso', 'Calle 83', 'Hidalgo');
```

- `update`: permite actualizar los datos existentes, `update` no inserta datos que no existan. A continuación se muestra un ejemplo:

```mysql
UPDATE people
SET last_name = 'Chávez', city = 'Mérida'
WHERE person_id = 1;

UPDATE people
SET first_name = 'Juan'
WHERE city = 'Mérida'

-- Si no se especifíca una cláusula WHERE, corremos el riegos de modificar de forma masiva nuestra base de datos
UPDATE people
SET first_name = 'Juan';
```

- `delete`: puede borrar el contenido de una tabla. A continuación se muestra un ejemplo:

```mysql
DELETE FROM people
WHERE person_id = 1;

-- Borra todo el contenido de la tabla
DELETE FROM people;
```

- `select`: trae información de la base de datos, para poder modificar la información de la base de datos, primero se tiene que traer. A continuación se muestra un ejemplo:

```mysql
SELECT first_name, last_name
FROM people;
```

## Consultas a una base de datos
### ¿Por qué las consultas son tan importantes?
Las consultas en una base de datos juegan un papel muy fundamental, puesto que facilitan de manera considerable los procesos en cualquier empresa.

ETL (Extract Transform Load) hace parte del proceso de integración de datos, mas aun es un componente muy importante que completa el resultado final en la relación de aplicaciones y sistemas.

### Estructura básica de un query
Las queries son la forma en la que se estructuran las preguntas a la base de datos para que nos traiga la información requerida.

```mysql
SELECT * -- selecciona todas las columnas
FROM people -- tabla de la cual se extraé la información
```

### SELECT
La sentencia `SELECT` nos permite filtrar la información que solicitamos a la base de datos. Un `SELECT` debe tener como mínimo un `FROM` para poder funcionar. Podemos usar un alias para hacer más legible el resultado de nuestra consulta, esto se logra agregando `AS` a un lado de nuestro atributo.

```mysql
SELECT
    title AS Header,
    pub_date AS Published
FROM posts;
```

`SELECT` nos permite usar datos que se crean en el momento.

```mysql
SELECT COUNT(*) AS NumberOfPosts
FROM posts;
```

### FROM
Indica de dónde se deben traer los datos y puede ayudar a hacer sentencias y filtros complejos cuando se quieren unir tablas. La sentencia compañera que nos ayuda con este proceso es `JOIN`.

Los diagramas de Venn son círculos que se tocan en algún punto para ver dónde está la intersección de conjuntos. Ayudan mucho para poder formular la sentencia `JOIN` de la manera adecuada dependiendo del query que se quiere hacer.

### WHERE
Nos ayuda a filtrar registros (filas de la tabla). Podemos filtrar por ejemplo, a partir de cierto numero de ID (con el operador de mayor o menor).

- `LIKE`: cuando no conocemos la cadena exacta, podemos filtrar según alguna caracteristica. Por ejemplo:

    `WHERE title LIKE '%scandal%'` lo que hace es buscar aquellos títulos que tengan la palabra escandalo en alguna parte. Sin embargo, como los signos porcentuales indican que hay algo mas, si quitamos, por ejemplo, el del final (quedando `'%scandal'`), estaremos buscando aquellos títulos que terminen con la palabra «escándalo», ya que indicamos que después de esta palabra no hay nada más.

- `BETWEEN`: la traducción de esta palabra al español es «entre». Por lo tanto, como podemos imaginar, filtrará entre dos valores a designar. Por ejemplo:

    `WHERE pub_date BETWEEN '2019-01-01' AND '2019-01-10'` filtrará las publicaciones con fecha de publicación entre el 1 de enero de 2019 y 10 de enero de 2019. Puede utilizarse tambien con valores numéricos (y por lo tanto, por ejemplo, con los IDs).

### WHERE (NULL y NOT NULL)
`NULL` no corresponde a ningún valor en particular, sino a una "ausencia" de valor, por lo tanto un `NOT NULL` correspondería a que no hay una aparente ausencia, es decir, existe un valor así sea un 0. `NULL` no es igual a nada por lo que en SQL no se le puede asociar con el operador igual que, en vez de esto se le atribuye en un `WHERE` con un `IS NULL`. Para valores `NOT NULL`, también se aplica la misma sintaxis. Para agregar un criterio adicional con `WHERE`, se usa `AND`.

### GROUP BY
`GROUP BY` nos permite hacer consultas mucho mas organizadas, de manera que la consulta se ejecuta dividida por los diferentes valores que posee la columna, de esta manera podemos determinar no solo el número de valores diferentes que puede tener un atributo, sino muchos otros parámetros como la cantidad de los mismos (con `COUNT(*)`).

```mysql
SELECT status, SUM(id) id_sum
FROM posts
GROUP BY status;
```

### ORDER BY y HAVING
A través de `ORDER BY` podemos ordenar nuestras consultas mediante criterios que podemos asignar mediante esta sentencia. Con la palabra reservada `ASC`, podemos ordenar nuestra consulta de manera ascendente, y a través de la palabra reservada `DESC`, podemos ordenar la misma de forma descendente. Ambas sentencias funcionan de manera similar tanto para letras como para números, en el caso de las letras, si es de forma ascendente, las letras irán por orden alfabetico de la A a la Z.

`HAVING` nos permite hacer lo similar a un `WHERE`, a diferencia de que `WHERE` no es posible usarlo cuando estamos haciendo consultas con agrupaciones, cosa que si se puede hacer con `HAVING`.
