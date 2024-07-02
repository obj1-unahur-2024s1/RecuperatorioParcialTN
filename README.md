# Intensamente
![alt text](./img/intensamente.png)
## Parte I - Las Emociones 
De todas las emociones que tendremos que modelar nos interesa conocer la intensidad, el color que la representa y si puede liberarse o no.

La condición común para saber si una emoción puede liberarse o no, es que el nivel de intensidad sea mayor o igual a un valor común e igual para todas las emociones. La configuración inicial del valor es igual a 75 pero puede cambiarse en cualquier momento.

La intensidad de una emoción aumenta en una cantidad determinada de acuerdo a los distintos eventos que pueden ocurrir y disminuye cuando se **expresa**. Todas las emociones se expresan siempre y cuando puedan **liberarse** y la cantidad de intensidad que disminuye depende de cada emoción.


### Furia
La emoción de la **furia** conoce una serie de **_palabrotas_** que son usadas cuando se expresa la emoción. Cuando se crea la emoción no conoce ninguna palabrota pero se pueden ir agregando y quitando. La furia puede ser representada por los colores "rojo", "naranja", "rosa" o "cereza"

Para saber si esta emoción puede liberarse o no, además de la condición común, necesita conocer al menos una palabrota con más de 7 letras.

La acción de expresar la furia si puede ser liberarse consiste en disminuir la intensidad en un valor igual a la cantidad de letras de la palabrota más larga que conozca. Por ejemplo: Si conociera las palabrotas ["changos","demonios","wtf"] la intensidad se disminuiría en 8 unidades. 


### Alegría
La emoción de la **alegría** lleva la cuenta de cuantos **_acontecimientos positivos_** fueron ocurriendo. Los acontecimientos positivos pueden solo aumentar en una cantidad determinada y llegar a un máximo de 100, arrancando en 0. Los colores definidos para representar la alegría pueden ser: "verde", "esmeralda", "lima" o "menta"

La emoción de la alegría puede ser liberada cuando la cantidad de acontecimientos positivos es un número par ó cuando se cumple la condición común.

Expresar la **alegría** cuando puede ser liberada consiste en disminuir la intensidad en un porcentaje igual a la cantidad de eventos positivos. Por ejemplo: si la cantidad de acontecimientos positivos fueran 15, la intensidad disminuiría en un 15%.

### Tristeza
La emoción de la **tristeza** sabe muy bien cuando es producida por **melancolía** o no, y además si es  **llorona** o no. La gama de colores azules es la que definen a la tristeza y pueden ser: "azul", "celeste", "marino" o "zafiro" 

La tristeza puede ser liberada ó bien cuando es melancólic ó llorona, independientemente si se cumple la condición común o no.

El valor que disminuye la intensidad al expresar la **tristeza**, siempre y cuando pueda ser liberada, depende del color que tenga configurado la tristeza. Si la tristesza es de color "azul" entonces disminuye 10 unidades en caso contrario solo 5.

#### Test Parte I - Las Emociones
A continuación se muestran varios ejemplos para realizar los test. No es necesarios hacerlos todos pero les sugerimos hacer al menos 1 de cada emoción.


Consideremos las siguientes emociones:

|Emoción|Intensidad |Color|Configuración Propia|
|-------|-----------|-----|--------------
|furia1|75|rojo|palabrotas ["demonios","changos"]|
|furia2|78|naranja|palabrotas ["changos","wtf"]|
|alegria1|70|verde|25 acontecimientos positivos|
|alegria2|80|esmeralda|24 acontecimientos positivos|
|tristeza1|60|azul|melancolía=true y llorona=true|
|tristeza2|60|marino|melancolía=true y llorona=false|

Por cada emoción validar si puede ser liberarse o no. Luego también expresar cada emoción y verificar el valor de la intensidad.

|Emoción|puedeLiberarse| Intensidad antes|Intensidad después de expresar|
|-------|--------------|----------------|-----------------------------|
|furia1|true|75|67|
|furia2|false|78|78|
|alegria1|false|70|70|
|alegria2|true|80| 60.8|
|tristeza1|true|60|50|
|tristeza2|true|60| 55|

## Parte II - Los Individuos
Todos los individuos pueden tener muchas emociones y en nuestro modelo podemos tener incluso más de un mismo tipo de emoción. Además de cada individuo debemos saber si es adolecente o no. Los expertos en las emociones nos informan que la etapa de adolescencia arranca con 12 años y termina cuando cumple 19 años.

De cada individuo nos interesa saber:
- Si está por explotar emocionalmente. Esto ocurre cuando todas sus emociones pueden liberarse.
- El delta emocional que se calcula como diferencia entre los valores máximo y mínimo de las intensidades de las emociones.
- El mapa cromático de las emociones que consiste en el conjunto de colores de las emociones sin repetidos.
- La energía emocional que se calcula como la suma de las intensidades de solo aquellas emociones que son consideradas emociones promedio. Se considera que una emoción es promedio si su intensidad se encuentra entre los valores 50 y 75.

Además los individuos deben ser capaces de:
-   expresar todas la emociones 

### Test Parte II - Los Individuos
Considera a Raily un niña de 11 años que tiene actualmente las siguientes emociones:

|Emoción|Intensidad |Color|Configuración Propia|
|-------|-----------|-----|--------------
|furia1|75|rojo|palabrotas ["demonios","changos"]|
|alegria2|80|esmeralda|24 acontecimientos positivos|
|tristeza2|60|marino|melancolía=true y llorona=true|

Los resultados esperados sobre Raily serían los siguientes:
- Está por explotar emocionalmente.
- El delta emocional es igual a 20
- El mapa cromático es "rojo", "esmeralda", "marino"
- La energía emocional es igual a 135



## Eventos - Etapa III
De cada Evento nos interesa registrar el nombre, el color emocional asociado al evento y el nivel de impacto que produce.

Los eventos deben contar con la posibilidad de transeferirse a un individuo ```transferirA(unIndividuo)```,  y a su vez el individuo deberá registrar que evento le fue transferido. **Pero atención**, antes de realizar cualquier acción se debe controlar si ya fue transferido o no. Y si ya fue transferido previamente deberá informarse el error **"El evento ya fue transferido al individuo"**. 

Además, los individuos deberán contar con la posibilidad de procesar todos los eventos que tiene registrados y quedar sin eventos al final del proceso. 

La acción de procesar un evento por un individuo es tomar solo aquellas emociones cuyo color coincida con el color emocional el evento y producirles un efecto ```efecto(unEvento)```que varia por cada emoción.

- Furia aumenta su intensidad en un 50% más del valor del impacto del evento.
- Alegría aumenta su intensidad en el mismo valor que el nivel del impacto del evento, y también aumenta en uno el registro de acontecimientos positivos.
- Tristeza aumenta su intensidad en solo la mitad del nivel del impacto del evento, y pasa a ser melancólica y llorona.

### Test Parte III 
Generar los dos siguientes eventos:

Evento|Nombre |ColorEmocial|Impacto|
|-----|-------|------------|-------|
|evento1|11 De Septiembre|rojo|10|
|evento2|Alunizaje|esmeralda|10|

Registrarle a Raily (con las mismas emociones usandas en el test de la etapa II) los dos eventos.

|Emoción|Intensidad |Color|Configuración Propia|
|-------|-----------|-----|--------------
|furia1|75|rojo|palabrotas ["demonios","changos"]|
|alegria2|80|esmeralda|24 acontecimientos positivos|
|tristeza2|60|marino|melancolía=true y llorona=true|

Controlar en un primer test que Raily tenga 2 eventos registrados.

Realizar un segundo test que procese los eventos de Raily y dentro del mismo controle que:

- Ya no tenga eventos registrados.
- Que la intensidad de furia1 sea de 90.
- Que la intesidad de alegria2 también sea de 90.
- Que la cantidad de aconteciomientos positivos de algegria2 sea de 25.
