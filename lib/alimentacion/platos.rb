class Plato 
	attr_reader :nombre_plato, :lista_alimentos, :lista_gramos
        def initialize(nombre_plato, lista_alimentos, lista_gramos)
                @nombre_plato = nombre_plato
                @lista_alimentos = lista_alimentos
                @lista_gramos = lista_gramos
        end

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


end
