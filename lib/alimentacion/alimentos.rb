class Alimentos
	attr_reader :nombre,:proteinas,:hidratos,:lipidos,:gei,:terreno
	def initialize(nombre,proteinas,hidratos,lipidos,gei,terreno)
		@nombre,@proteinas,@hidratos,@lipidos,@gei,@terreno = nombre,proteinas,hidratos,lipidos,gei,terreno
	end
end
