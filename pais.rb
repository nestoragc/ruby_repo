class Pais
  attr_accessor :nombre, :personas

  def initialize(nombre)
    @nombre = nombre
    @personas = []
  end

  def agregar_persona(persona)
    @personas << persona
  end

  def porcentaje_de_hombres
    return 0 if total_personas.zero?

    (total_hombres / total_personas.to_f) * 100
  end

  def porcentaje_de_mujeres
    return 0 if total_personas.zero?

    (total_mujeres / total_personas.to_f) * 100
  end

  def promedio_de_edad
    return 0 if total_personas.zero?

    total_edad = @personas.sum { |persona| persona.edad }
    total_edad / total_personas
  end

  private

  def total_personas
    @personas.count
  end

  def total_hombres
    @personas.count { |persona| persona.es_hombre? }
  end

  def total_mujeres
    @personas.count { |persona| persona.es_mujer? }
  end
end
