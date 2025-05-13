local widget = require("widget")
local media = require("media")

-- Cargar imagen de fondo
local fondo = display.newImageRect("fondo_clinica.png", system.ResourceDirectory, display.contentWidth, display.contentHeight)
if fondo then
    fondo.x = display.contentCenterX
    fondo.y = display.contentCenterY
else
    print("ERROR: No se pudo cargar la imagen de fondo.")
end

-- Función para reproducir videos
local function reproducirVideo(nombreVideo)
    media.playVideo(nombreVideo, system.ResourceDirectory, true)
end

-- Función para mostrar instrucciones con opción de ver video
local function mostrarInstrucciones(titulo, mensaje, video)
    native.showAlert(titulo, mensaje, {"OK", "Ver Video"}, function(event)
        if event.action == "clicked" and event.index == 2 then
            reproducirVideo(video)
        end
    end)
end

-- Función para mostrar números de emergencia bien alineados
local function mostrarEmergencias()
    local mensaje = [[
📞 **Números de Emergencia** 📞

🔴 **Emergencias** .............. 911  
🔴 **Capufe** ....................... 074  
🔴 **Ángeles Verdes** .......... 078  
🔴 **Cruz Roja** .................. 55 53 95 11 11  
🔴 **LOCATEL** .................. 55 56 58 11 11  
🔴 **Protección Civil** ......... 55 51 28 00 00  
🔴 **Denuncia Anónima** ... 089  
🔴 **Incendios Forestales** ... 800 46 23 63 46  
🔴 **Policía Federal** ............ 088  
🔴 **Fuga de agua (CDMX)** ... 800 014 2482  
🔴 **Fuga de gas** .................. 911  
]]
    native.showAlert("Números de Emergencia", mensaje, {"OK"})
end

-- Función para crear botones con íconos
local function crearBoton(icono, x, y, mensaje, video)
    local boton = widget.newButton({
        defaultFile = icono,
        x = x,
        y = y,
        width = 80,
        height = 80,
        onRelease = function() mostrarInstrucciones(icono, mensaje, video) end
    })

    if not boton then
        print("ERROR: No se pudo cargar el icono " .. icono)
    end
end

-- Crear botones con íconos e instrucciones
crearBoton("icon_rcp.png", display.contentCenterX - 100, 200, 
    "1. Verifica si la persona no responde y no respira.\n2. Llama a emergencias (911).\n3. Realiza 30 compresiones torácicas (100-120 por minuto).\n4. Da 2 respiraciones boca a boca.\n5. Repite hasta que llegue ayuda.",
    "¿Cómo dar RCP de la manera correcta_ #reanimación #PrimerosAuxilios.mp4")

crearBoton("icon_corte.png", display.contentCenterX + 100, 200, 
    "1. Lávate las manos antes de tocar la herida.\n2. Limpia la herida con agua y jabón.\n3. Aplica presión con una gasa estéril para detener el sangrado.\n4. Usa un vendaje limpio para cubrir la herida.\n5. Si la herida es profunda, busca atención médica.",
    "5 pasos para cuidar una herida.mp4")

crearBoton("icon_quemadura.png", display.contentCenterX - 100, 320, 
    "1. **Quemadura leve**: Enfría con agua fría 10-20 min, no revientes ampollas.\n2. **Quemadura grave**: No retires la ropa pegada, cubre con un paño húmedo y llama al 911.\n3. **Quemadura química**: Enjuaga con abundante agua por 20 min y busca ayuda médica.",
    "Quemaduras_ cómo tratarlas.mp4")

crearBoton("icon_atragantamiento.png", display.contentCenterX + 100, 320, 
    "1. Golpea 5 veces la espalda entre los omóplatos con la palma de la mano.\n2. Si no funciona, realiza la maniobra de Heimlich (presiona fuerte el abdomen por debajo de las costillas).\n3. Si la persona pierde el conocimiento, inicia RCP y llama al 911.",
    "¿Qué hacer en caso de asfixia o atragantamiento_.mp4")

-- Botón para ver los números de emergencia
local botonEmergencia = widget.newButton({
    label = "🚨 Emergencias",
    x = display.contentCenterX,
    y = display.contentHeight - 50,
    width = 200,
    height = 50,
    shape = "roundedRect",
    cornerRadius = 10,
    fillColor = { default={1, 0, 0, 1}, over={1, 0.2, 0.2, 1} },
    labelColor = { default={1, 1, 1}, over={1, 1, 1} },
    onRelease = mostrarEmergencias
})
