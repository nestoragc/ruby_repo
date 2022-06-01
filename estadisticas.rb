module Estadisticas
  def self.porcentaje_de_hombres(paises)
    personas = paises.reduce([]) { |lista, pais| lista + pais.personas }
    total_hombres = personas.count { |persona| persona.es_hombre? }
    total_personas = personas.count

    (total_hombres / total_personas.to_f) * 100
  end

  def self.porcentaje_de_mujeres(paises)
    personas = paises.reduce([]) { |lista, pais| lista + pais.personas }
    total_mujeres = personas.count { |persona| persona.es_mujer? }
    total_personas = personas.count

    (total_mujeres / total_personas.to_f) * 100
  end

  def self.promedio_de_edad(paises)
    personas = paises.reduce([]) { |lista, pais| lista + pais.personas }
    total_edad = personas.sum { |persona| persona.edad }
    total_personas = personas.count

    total_edad / total_personas
  end
end
