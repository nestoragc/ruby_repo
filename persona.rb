class Persona
  attr_accessor :nombre, :edad, :sexo, :pais

  def initialize(nombre:, edad:, sexo:, pais:)
    @nombre = nombre
    @edad = edad
    @sexo = sexo
    @pais = pais
  end

  def es_hombre?
    sexo == 'Masculino'
  end

  def es_mujer?
    sexo == 'Femenino'
  end
end
