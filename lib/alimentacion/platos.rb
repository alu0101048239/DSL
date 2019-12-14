# encoding: utf-8
# Esta clase contiene información acerca de los distintos alimentos que forman un plato.
# Se calcula el porcentaje de proteínas, hidratos y lípidos que contiene cada conjunto de alimentos, así como su valor energético.
#
# Author::      David Hernández Suárez (mailto:alu0101048239@ull.edu.es)
# Copyright::   Cretive Commons
# License::     Distributes under the same terms as Ruby

class Plato 
	attr_reader :nombre_plato, :lista_alimentos, :lista_gramos
	include Comparable

	# Se utiliza el módulo Comparable, comparando los alimentos en base a su porcentaje de proteínas.
        def <=>(anOther)
                self.porcentaje_proteinas <=> anOther.porcentaje_proteinas
        end

	# Se asignan el nombre del plato, la lista de alimentos que lo compone y los gramos de cada alimento.
        def initialize(nombre_plato, lista_alimentos, lista_gramos)
                @nombre_plato = nombre_plato
                @lista_alimentos = lista_alimentos
                @lista_gramos = lista_gramos
        end

	# Se calcula el porcentaje de proteínas total del plato
	def porcentaje_proteinas
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                suma_proteinas = 0
                suma_gramos = 0
                while (!aux.nil?)
                        suma_proteinas += ( (aux[:value].proteinas)*(aux2[:value]) )/100
                        suma_gramos += aux2[:value]
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return ( (suma_proteinas/suma_gramos)*100 ).round(2)

        end

	# Se calcula el porcentaje de hidratos de carbono total del plato
	 def porcentaje_hidratos
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                suma_hidratos = 0
                suma_gramos = 0
                while (!aux.nil?)
                        suma_hidratos += ( (aux[:value].hidratos)*(aux2[:value]) )/100
                        suma_gramos += aux2[:value]
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return ( (suma_hidratos/suma_gramos)*100 ).round(2)

        end

	# Se calcula el porcentaje de lípidos total del plato
	def porcentaje_lipidos
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                suma_lipidos = 0
                suma_gramos = 0
                while (!aux.nil?)
                        suma_lipidos += ( (aux[:value].lipidos)*(aux2[:value]) )/100
                        suma_gramos += aux2[:value]
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return ( (suma_lipidos/suma_gramos)*100 ).round(2)

        end

	# Se calcula el valor calórico total del plato
	def valor_calorico
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                calorias = 0
                while (!aux.nil?)
                        aux[:value].proteinas = ( (aux[:value].proteinas) * (aux2[:value]) )/100
                        aux[:value].hidratos = ( (aux[:value].hidratos) * (aux2[:value]) )/100
                        aux[:value].lipidos = ( (aux[:value].lipidos) * (aux2[:value]) )/100
                        calorias += aux[:value].valor_energetico
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return calorias.round(2)
        end
	
	# Se obtiene el plato formateado
	def to_s
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                vector = []
                vector << @nombre_plato
                while (!aux.nil?)
                        vector << aux[:value].to_s
                        vector << aux2[:value]
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return vector

        end

end

# encoding: utf-8
# Esta clase, que hereda de la clase Plato, calculará las emisiones diarias y anuales de los gases de efecto invernadero, y el uso del terreno# en referencia a los alimentos que componen cada plato.
#
# Author::      David Hernández Suárez (mailto:alu0101048239@ull.edu.es)
# Copyright::   Cretive Commons
# License::     Distributes under the same terms as Ruby


class Eficiencia_Energetica < Plato

	attr_reader :nombre_plato, :lista_alimentos, :lista_gramos
        include Comparable
        
	# Se utiliza el módulo Comparable, comparando los alimentos en base a su huella nutricional.
	def <=>(anOther)
               #self.uso_terreno <=> anOther.uso_terreno
		self.huella_nutricional <=> anOther.huella_nutricional
        end

	# Se asignan el nombre del plato, la lista de alimentos que lo contienen y la lista de gramos de cada alimento.
        def initialize(nombre_plato, lista_alimentos, lista_gramos)
                super(nombre_plato, lista_alimentos, lista_gramos)
        end

	# Se calculan las emisiones anuales de gases de efecto invernadero que produce el plato
        def emisiones_gases_anuales
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                suma_gases_anuales = 0
                while (!aux.nil?)
                        suma_gases_anuales += aux[:value].auxiliar(aux2[:value])
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return suma_gases_anuales.round(2)
        end

	# Se calculan las emisiones diarias de gases de efecto invernadero que produce el plato
	def emisiones_gases_diarios
                suma = (emisiones_gases_anuales / 365)
                return suma.round(3)
        end

	# Se calcula el uso del terreno anual que produce el plato
	def uso_terreno
                aux = @lista_alimentos.head
                aux2 = @lista_gramos.head
                suma_terreno = 0
                while (!aux.nil?)
                        suma_terreno += aux[:value].auxiliar2(aux2[:value])
                        aux = aux[:next]
                        aux2 = aux2[:next]
                end

                return suma_terreno.round(2)
        end

	# Se obtiene la información de gases y terreno formateada
	def to_s
                "( #{self.emisiones_gases_anuales}, #{self.emisiones_gases_diarios}, #{self.uso_terreno} )"

        end

	# Se calcula la huella nutricional del plato
	def huella_nutricional
                if (valor_calorico < 670)
                        aux = 1
                elsif (valor_calorico < 830)
                        aux = 2
                else
                        aux = 3
                end

                if (emisiones_gases_anuales < 0.8)
                        aux2 = 1
                elsif (emisiones_gases_anuales < 1.2)
                        aux2 = 2
                else
                        aux2 = 3
                end

                return ((aux+aux2)/2.0).round(2)
        end



end
