require './persona'

class Encuesta
  attr_reader :preguntas

  def initialize(preguntas)
    @preguntas = preguntas
  end 

  def presentar_encuesta
    puts 'Ingresa tu nombre'
    nombre = gets.chomp

    puts 'Ingresa tu edad'
    edad = gets.chomp.to_i

    respuestas = mostrar_preguntas
    Persona.new(nombre: nombre, edad: edad, sexo: respuestas[0], pais: respuestas[1])
  end

  def mostrar_preguntas
    preguntas.map do |pregunta|
      pregunta.imprimir
      respuesta = gets.chomp
      pregunta.obtener_valor_real(respuesta)
    end
  end
end
