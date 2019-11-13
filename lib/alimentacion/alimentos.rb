class Alimentos
	attr_reader :nombre,:proteinas,:hidratos,:lipidos,:gei,:terreno
	def initialize(nombre,proteinas,hidratos,lipidos,gei,terreno)
		@nombre,@proteinas,@hidratos,@lipidos,@gei,@terreno = nombre,proteinas,hidratos,lipidos,gei,terreno
	end

	def to_s
		"(#{@nombre},#{@proteinas},#{@hidratos},#{@lipidos},#{@gei},#{@terreno})"
	end

	def valor_energetico
                energia = 4 * (@proteinas + @hidratos) + (@lipidos * 9)
                energia.round(2)
        end

end
