class Pregunta
  attr_reader :enunciado, :opciones_de_respuesta

  LETRAS = ('A'..'Z').to_a

  def initialize(enunciado, respuestas)
    @enunciado = enunciado
    @opciones_de_respuesta = respuestas
  end

  def respuesta_valida?(respuesta)
    posicion = LETRAS.index(respuesta.upcase)

    return false if posicion == nil

    opciones_de_respuesta[posicion] != nil
  end

  def obtener_valor_real(respuesta)
    posicion = LETRAS.index(respuesta.upcase)
    opciones_de_respuesta[posicion]
  end

  def imprimir
    puts @enunciado

    @opciones_de_respuesta.each_with_index do |respuesta, posicion| 
      puts "#{LETRAS[posicion]}) #{respuesta}."
    end

    nil
  end
end
