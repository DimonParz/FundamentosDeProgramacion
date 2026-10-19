Algoritmo MesaDePartesDigital
	
    Definir nombre, documento, codigo Como Cadena
    Definir tipoTramite, opcionMenu, tipoDoc, contadorTramites, opcionCancel Como Entero
    Definir cancelarRegistro Como Logico
	
    contadorTramites <- 0
	
    Repetir
        Escribir "=================================================="
        Escribir "MUNICIPALIDAD DISTRITAL DE SANTA ROSA DEL NORTE"
        Escribir "       SISTEMA DE MESA DE PARTES DIGITAL        "
        Escribir "=================================================="
        Escribir "1. Registrar nuevo tramite"
        Escribir "2. Salir del sistema"
        Escribir "Seleccione una opcion (1-2):"
        Leer opcionMenu
		
        Si opcionMenu = 1 Entonces
            // Reiniciamos la bandera a falso cada vez que inicia un nuevo registro
            cancelarRegistro <- Falso
            
            // 1.1 Validar Nombre
            Repetir
                Escribir "Ingrese el nombre del ciudadano o razon social:"
                Leer nombre
                Si nombre = "" Entonces
                    Escribir "Error: El nombre no puede estar vacio."
                    Escribir "Desea cancelar el registro? (1: Si, cancelar / 2: No, reintentar)"
                    Leer opcionCancel
                    Si opcionCancel = 1 Entonces
                        cancelarRegistro <- Verdadero
                    FinSi
                FinSi
            Hasta Que nombre <> "" O cancelarRegistro = Verdadero
			
            // 1.2 Validar Tipo de Documento (Solo entra si no se ha cancelado)
            Si cancelarRegistro = Falso Entonces
                Repetir
                    Escribir "Seleccione el tipo de documento:"
                    Escribir "1. DNI (8 digitos)"
                    Escribir "2. RUC (11 digitos)"
                    Leer tipoDoc
                    Si tipoDoc <> 1 Y tipoDoc <> 2 Entonces
                        Escribir "Error: Seleccione una opcion valida (1 o 2)."
                        Escribir "Desea cancelar el registro? (1: Si, cancelar / 2: No, reintentar)"
                        Leer opcionCancel
                        Si opcionCancel = 1 Entonces
                            cancelarRegistro <- Verdadero
                        FinSi
                    FinSi
                Hasta Que (tipoDoc = 1 O tipoDoc = 2) O cancelarRegistro = Verdadero
            FinSi
			
            // 1.3 Validar Longitud del Documento
            Si cancelarRegistro = Falso Entonces
                Repetir
                    Escribir "Ingrese el numero de documento:"
                    Leer documento
                    
                    Si (tipoDoc = 1 Y Longitud(documento) <> 8) O (tipoDoc = 2 Y Longitud(documento) <> 11) Entonces
                        Si tipoDoc = 1 Entonces
                            Escribir "Error: El DNI debe tener exactamente 8 digitos."
                        Sino
                            Escribir "Error: El RUC debe tener exactamente 11 digitos."
                        FinSi
                        
                        Escribir "Desea cancelar el registro? (1: Si, cancelar / 2: No, reintentar)"
                        Leer opcionCancel
                        Si opcionCancel = 1 Entonces
                            cancelarRegistro <- Verdadero
                        FinSi
                    FinSi
                Hasta Que ((tipoDoc = 1 Y Longitud(documento) = 8) O (tipoDoc = 2 Y Longitud(documento) = 11)) O cancelarRegistro = Verdadero
            FinSi
			
            // 1.4 Validar Tipo de Tramite
            Si cancelarRegistro = Falso Entonces
                Repetir
                    Escribir "Seleccione el tipo de tramite:"
                    Escribir "1. Solicitud"
                    Escribir "2. Reclamo"
                    Escribir "3. Queja"
                    Escribir "4. Otro"
                    Leer tipoTramite
                    Si tipoTramite < 1 O tipoTramite > 4 Entonces
                        Escribir "Error: Seleccione un tipo de tramite valido (1 - 4)."
                        Escribir "Desea cancelar el registro? (1: Si, cancelar / 2: No, reintentar)"
                        Leer opcionCancel
                        Si opcionCancel = 1 Entonces
                            cancelarRegistro <- Verdadero
                        FinSi
                    FinSi
                Hasta Que (tipoTramite >= 1 Y tipoTramite <= 4) O cancelarRegistro = Verdadero
            FinSi
			
            // 1.5 Finalizacion: ¿Se canceló o fue exitoso?
            Si cancelarRegistro = Verdadero Entonces
                Escribir "--------------------------------------------------"
                Escribir ">>> REGISTRO CANCELADO. Volviendo al menu principal..."
                Escribir "--------------------------------------------------"
            Sino
                // Solo suma al contador si paso todos los filtros
                contadorTramites <- contadorTramites + 1
                
                Si contadorTramites < 10 Entonces
                    codigo <- "MP-00" + ConvertirATexto(contadorTramites)
                Sino
                    Si contadorTramites < 100 Entonces
                        codigo <- "MP-0" + ConvertirATexto(contadorTramites)
                    Sino
                        codigo <- "MP-" + ConvertirATexto(contadorTramites)
                    FinSi
                FinSi
				
                Escribir "--------------------------------------------------"
                Escribir "Tramite registrado correctamente."
                Escribir "Ciudadano/Entidad: ", nombre
                Escribir "Documento: ", documento
                Escribir "Codigo de registro: ", codigo
                Escribir "Conserve su codigo de registro."
                Escribir "--------------------------------------------------"
            FinSi
			
        Sino
            Si opcionMenu = 2 Entonces
                Escribir "Cerrando el sistema..."
                Escribir "Total de tramites registrados hoy: ", contadorTramites
            Sino
                Escribir "Error: Seleccione una opcion valida del menu principal (1 o 2)."
            FinSi
        FinSi
		
    Hasta Que opcionMenu = 2
	
FinAlgoritmo