# Proyecto 1 carrito de compras

Este programa, simula un carrito de compras online con un máximo de 10 productos, (esto no era parte de los requerimientos básicos, pero cuando me plantié la idea de un arreglo bidimensional llegué a la idea de crear un carrito con un límite de productos). El algoritmo realiza cálculos sobre el precio final de los productos, aplicando descuentos, impuestos y costo de envío, cumpliendo con todos los requisitos establecidos por la rúbrica del proyecto.


Variables y estructuras utilizadas

Arreglos:

- producto[10]: Arreglo unidimensional que guarda los nombres de los productos ingresados.(descubrí sobre la marcha que al dimensionar, queda declarado y no hace falta declararlo y después aparte dimensionarlo)
- datos[10,3]: Arreglo bidimensional que guarda, para cada producto:
  - Columna 1: precio original  
  - Columna 2: peso unitario  
  - Columna 3: cantidad

Esta estructura me permitió organizar la información de manera ordenada y asegurarme un acceso directo a los datos de cada producto para su posterior cálculo.

La rúbrica exige el uso de arreglos unidimensionales y bidimensionales, por lo tanto, diseñé el sistema de forma que cada producto ocupara una fila del arreglo bidimensional. Este me dió muchos dolores de cabeza, porque al principio guardaba las variables de precio y peso por producto y me costaba calcular cuando llegaba al final para que diera con el resultado del ejemplo, hasta que lo conseguí. Como PSeInt no permite aumentar dinámicamente el tamaño de los arreglos, opté por establecer un límite de 10 productos por carrito(aunque el máximo puede ser cualquier número, pensando en un carrito de compras internacional, creo que el máximo de 10 está bien), lo cual:
- Facilita el uso de arreglos fijos sin errores de desbordamiento (que era lo que me pasaba en las primeras pruebas)
- Representa una situación realista en sistemas de compra (límite de ítems por carrito).

Flujo del programa

1. Se inicializan los arreglos y variables.
2. Se solicita al usuario los datos de cada producto.
3. Se valida que no se exceda el máximo de productos (10).
4. Se acumulan precios, pesos y cantidades.
5. Se calculan descuentos, IVA y costo de envío.
6. Se muestra un detalle completo de la compra.

Ejemplo de ejecución (con los datos que estaban en la rúbrica en la página)

Entrada:
Producto: Zapatos  
Precio original: $100  
Peso: 3 kg  
Cantidad: 2 unidades

Cálculos:
- Precio con 10% de descuento: $90
- Con IVA (12%): $100.80
- Descuento por cantidad (5%): $95.76 por unidad
- Costo de envío: $10 + (2 * 3 kg) = $16
- Total a pagar: $207.52


Cometario final

Si bien el ejercicio no era tan complicado, la idea de implementar los arreglos me puso de cabeza y me costó mucho llegar a que coincidiera con los del ejemplo, pero se puede probar agregando más productos y poner otras ciudades en el despacho y la información final queda ajustada a los criterios.