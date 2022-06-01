require './encuesta'
require './pregunta'
require './pais'
require './estadisticas'

PREGUNTAS = [
  Pregunta.new('¿Cual es tu sexo?', ['Masculino', 'Femenino']),
  Pregunta.new('¿Cual es tu pais?', ['Argentina', 'Colombia', 'Mexico'])
]

PAISES = [
  Pais.new('Argentina'),
  Pais.new('Colombia'),
  Pais.new('México')
]

opcion_menu = 0
pregunta_pais = Pregunta.new('¿De que pais quieres ver las estadisticas?', ['Argentina', 'Colombia', 'Mexico'])

while opcion_menu != 5
  puts "escoge la opcion que quieres hacer: "
  puts "1. Realizar encuesta"
  puts "2. Mostrar estadisticas generales"
  puts "3. Mostrar estadisticas por pais"
  puts "4. Mostrar estadisticas de cada pais"
  puts "5. Salir"
  opcion_menu = gets.to_i

  if opcion_menu == 1
    encuesta = Encuesta.new(PREGUNTAS)
    persona = encuesta.presentar_encuesta
    case persona.pais
    when 'Argentina'
      pais = PAISES[0]
    when 'Colombia'
      pais = PAISES[1]
    when 'Mexico'
      pais = PAISES[2]
    else
      puts "El usuario ingreso #{persona.pais}"
    end 
    pais.agregar_persona(persona)

  elsif opcion_menu == 2
    puts "Promedio de edad, Porcentaje Hombres, Porcentaje Mujeres"
    puts "#{Estadisticas.promedio_de_edad(PAISES)}, #{Estadisticas.porcentaje_de_hombres(PAISES)}%, #{Estadisticas.porcentaje_de_mujeres(PAISES)}%"

  elsif opcion_menu == 3
    pregunta_pais.imprimir
    respuesta = gets.chomp
    puts "Promedio de edad, Porcentaje Hombres, Porcentaje Mujeres"

    case respuesta
    when 'a'
      pais = PAISES[0]
    when 'b'
      pais = PAISES[1]
    when 'c'
      pais = PAISES[2]
    end
    puts "#{pais.promedio_de_edad}, #{pais.porcentaje_de_hombres}%, #{pais.porcentaje_de_mujeres}%"

  elsif opcion_menu == 4
    puts "Promedio de edad, Porcentaje Hombres, Porcentaje Mujeres, Pais"
    PAISES.each do |pais|
      puts "#{pais.promedio_de_edad}, #{pais.porcentaje_de_hombres}, #{pais.porcentaje_de_mujeres}, #{pais.nombre}" 
    end
  elsif opcion_menu == 5
    puts "Adiós.........."
  else 
    puts "Ingresó una opción inválida, intente de nuevo." 
  end
end
