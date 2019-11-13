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

	def auxiliar(gramos)
                x = ( @gei * gramos ) / 1000
                x.round(2)
        end

        def auxiliar2(gramos)
                x = ( @terreno * gramos ) / 1000
                x.round(2)
        end

        def impacto_hombre(gramos)
                alimento1 = Alimentos.new("Carne vaca",21.1,0.0,3.1,50.0,164.0)
                alimento2 = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
                alimento3 = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                a = alimento1.auxiliar(gramos) + alimento2.auxiliar(gramos) + alimento3.auxiliar(gramos)
                b = alimento1.auxiliar2(gramos) + alimento2.auxiliar2(gramos) + alimento3.auxiliar2(gramos)
                vector = [a,b]
        end


end
