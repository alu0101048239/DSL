class Plato_DSL

	attr_reader :nombre_plato, :lista_alimentos
        include Comparable
        def <=>(anOther)
                self.porcentaje_proteinas <=> anOther.porcentaje_proteinas
        end

        def initialize(nombre_plato, &block)
                #@nombre_plato = nombre_plato
                @lista_alimentos = []

                if block_given?
                        if block.arity == 1
                                yield self
                        else
                                instance_eval(&block)
                        end
                end
        end

	def nombre (n)
		@nombre_plato = n
	end

	def alimento(descripcion, gramos = {})
		alimento = "- " + descripcion
		alimento << "\n     Información nutricional:"
		alimento << " || Cantidad: #{gramos[:Gramos]} gramos ||" if gramos[:Gramos]
		alimento << " Proteínas: #{gramos[:Proteinas]} gramos ||" if gramos[:Proteinas]
		alimento << " Hidratos: #{gramos[:Hidratos]} gramos ||" if gramos[:Hidratos]
		alimento << " Lípidos: #{gramos[:Lipidos]} gramos" if gramos[:Lipidos]
		@lista_alimentos << alimento
	end

	def to_s
		output = @nombre_plato
		output << "\n#{'=' * @nombre_plato.size}\n\n"
		output << "Alimentos: \n #{@lista_alimentos.join(', ')}\n\n"
	end

end
