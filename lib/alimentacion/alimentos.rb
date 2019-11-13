class Alimentos
	attr_reader :nombre,:proteinas
	def initialize(nombre,proteinas,hidratos,lipidos,gei,terreno)
		@nombre,@proteinas,@hidratos,@lipidos,@gei,@terreno = nombre,proteinas,hidratos,lipidos,gei,terreno
	end
end
