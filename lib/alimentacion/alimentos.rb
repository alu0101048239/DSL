class Alimentos
	attr_accessor :nombre,:proteinas,:hidratos,:lipidos,:gei,:terreno
	include Comparable

        def <=>(anOther)
		self. proteinas <=> anOther.proteinas
        end

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
        end

        def auxiliar2(gramos)
                x = ( @terreno * gramos ) / 1000
        end

        def impacto_hombre(gramos)
                alimento1 = Alimentos.new("Carne vaca",21.1,0.0,3.1,50.0,164.0)
                alimento2 = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
                alimento3 = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                a = alimento1.auxiliar(gramos) + alimento2.auxiliar(gramos) + alimento3.auxiliar(gramos)
                b = alimento1.auxiliar2(gramos) + alimento2.auxiliar2(gramos) + alimento3.auxiliar2(gramos)
		vector = [a.round(2),b.round(2)]
        end
	
	def impacto_mujer(gramos1,gramos2,gramos3,gramos4,gramos5)
                alimento1 = Alimentos.new("Tofu",10,2.37,6,2.0,2.2)
                alimento2 = Alimentos.new("Nuez",50,10.5,27,0.3,7.9)
                alimento3 = Alimentos.new("Camarones",10,0.85,0.34,18.0,2.0)
                alimento4 = Alimentos.new("Chocolate",5,44.34,28.30,2.3,3.4)
                alimento5 = Alimentos.new("Leche",6,8.72,5.82,3.2,8.9)
                a = alimento1.auxiliar(gramos1) + alimento2.auxiliar(gramos2) + alimento3.auxiliar(gramos3) + alimento4.auxiliar(gramos4) + alimento5.auxiliar(gramos5)
                b = alimento1.auxiliar2(gramos1) + alimento2.auxiliar2(gramos2) + alimento3.auxiliar2(gramos3) + alimento4.auxiliar2(gramos4) + alimento5.auxiliar2(gramos5)
                vector = [a.round(2),b.round(2)]
        end
end
