Algoritmo CarritoDeCompras
	
    // === 1. DECLARAR VARIABLES Y CONSTANTES ===
    Definir IVA, DESCUENTO_CUPON, DESCUENTO_CANTIDAD Como Real
    Definir COSTO_ENVIO_FIJO, COSTO_ENVIO_POR_KG Como Real
    Definir i, totalUnidades Como Entero
    Definir cantidadTemp Como Entero
    Definir respuesta Como Caracter
    Definir pesoTotal, subtotal, totalBruto, totalDescuento1, totalDescuento2, totalIVA, totalEnvio, totalFinal Como Real
	
    // Inicializar constantes
    IVA <- 0.12
    DESCUENTO_CUPON <- 0.10
    DESCUENTO_CANTIDAD <- 0.05
    COSTO_ENVIO_FIJO <- 10
    COSTO_ENVIO_POR_KG <- 2
	
    // Inicializar contadores
    i <- 1
    totalUnidades <- 0
	
    // Arreglos necesarios
    Dimension nombre[10], ciudad[10], cantidad[10]
    Dimension precioOriginal[10], conDescuento[10], conIVA[10]
    Dimension conDescuentoCantidad[10], precioFinal[10]
    Dimension datosProducto[10, 2] // [0] = precio, [1] = peso
	
    // === 2. LEER DATOS DE ENTRADA ===
    Escribir "--------------------------------------------"
    Escribir "BIENVENIDO AL CARRITO DE COMPRAS"
    Escribir "M�ximo 10 unidades en total."
	
    Repetir
        Escribir "Producto ", i, ":"
		
        Escribir "Ingrese el Nombre de su producto:"
        Leer nombre[i]
		
        Escribir "Precio original:"
        Leer datosProducto[i,1]
        precioOriginal[i] <- datosProducto[i,1]
		
        Escribir "Cantidad (m�x disponible: ", 10 - totalUnidades, "):"
        Repetir
            Leer cantidadTemp
            Si cantidadTemp < 0 O cantidadTemp > (10 - totalUnidades) Entonces
                Escribir "Cantidad inv�lida. Intente con un n�mero entre 0 y ", 10 - totalUnidades
            FinSi
        Hasta Que cantidadTemp >= 0 Y cantidadTemp <= (10 - totalUnidades)
		
        cantidad[i] <- cantidadTemp
        totalUnidades <- totalUnidades + cantidadTemp
		
        Escribir "Peso total del paquete (kg):"
        Leer datosProducto[i,1]
		
        Escribir "Ciudad de despacho:"
        Leer ciudad[i]
		
        Si totalUnidades < 10 Entonces
            Escribir "�Desea agregar otro producto? (S/N):"
            Leer respuesta
            respuesta <- Minusculas(respuesta)
        Sino
            Escribir "Has alcanzado el m�ximo de 10 unidades."
            respuesta <- "n"
        FinSi
		
        i <- i + 1
    Hasta Que respuesta = "n" O i > 10
	
    // === 3. C�LCULOS ===
    totalBruto <- 0
    totalDescuento1 <- 0
    totalIVA <- 0
    totalDescuento2 <- 0
    totalFinal <- 0
	
    Para j <- 1 Hasta i - 1 Hacer
        subtotal <- precioOriginal[j] * cantidad[j]
        totalBruto <- totalBruto + subtotal
		
        // Descuento por cup�n
        conDescuento[j] <- precioOriginal[j] * (1 - DESCUENTO_CUPON)
        totalDescuento1 <- totalDescuento1 + (precioOriginal[j] * DESCUENTO_CUPON * cantidad[j])
		
        // Aplicar IVA
        conIVA[j] <- conDescuento[j] * (1 + IVA)
        totalIVA <- totalIVA + (conDescuento[j] * IVA * cantidad[j])
		
        // Descuento adicional por cantidad
        Si cantidad[j] >= 2 Entonces
            conDescuentoCantidad[j] <- conIVA[j] * (1 - DESCUENTO_CANTIDAD)
            totalDescuento2 <- totalDescuento2 + (conIVA[j] * DESCUENTO_CANTIDAD * cantidad[j])
        Sino
            conDescuentoCantidad[j] <- conIVA[j]
        FinSi
		
        // Precio final unitario y acumulado
        precioFinal[j] <- conDescuentoCantidad[j]
        totalFinal <- totalFinal + (precioFinal[j] * cantidad[j])
    FinPara
	
    // Calcular env�o
    pesoTotal <- 0
    Para j <- 1 Hasta i - 1 Hacer
        pesoTotal <- pesoTotal + datosProducto[j,1]
    FinPara
	
    totalEnvio <- COSTO_ENVIO_FIJO + (COSTO_ENVIO_POR_KG * pesoTotal)
    totalFinal <- totalFinal + totalEnvio
	
    // === 4. IMPRIMIR RESULTADOS ===
    Escribir "-------- DETALLE DE COMPRA --------"
    Para j <- 1 Hasta i - 1
        Escribir "Producto ", j, ": ", nombre[j]
        Escribir "  Precio original: $", precioOriginal[j]
        Escribir "  Subtotal con cup�n (10%): $", conDescuento[j]
        Escribir "  + IVA (12%): $", conIVA[j]
        Si cantidad[j] >= 2 Entonces
            Escribir "  - Descuento por cantidad (5%): aplicado"
        Sino
            Escribir "  - Descuento por cantidad (5%): no aplica"
        FinSi
        Escribir "  Precio final unitario: $", conDescuentoCantidad[j]
        Escribir "  Cantidad: ", cantidad[j]
        Escribir "  Total producto: $", precioFinal[j] * cantidad[j]
        Escribir ""
    FinPara
	
    Escribir "-------- RESUMEN FINAL --------"
    Escribir "Subtotal bruto sin descuentos: $", totalBruto
    Escribir "Descuento por cup�n (10%): -$", totalDescuento1
    Escribir "IVA (12%): +$", totalIVA
    Escribir "Descuento por cantidad (5%): -$", totalDescuento2
    Escribir "Costo de env�o: $", totalEnvio
    Escribir "TOTAL A PAGAR: $", totalFinal
	
    Escribir "*** Ejecuci�n Finalizada. ***"
	
FinAlgoritmo
