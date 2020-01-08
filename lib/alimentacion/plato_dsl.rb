class Plato_DSL

	attr_reader :nombre_plato, :lista_alimentos, :lista_gramos
        include Comparable
        def <=>(anOther)
                self.porcentaje_proteinas <=> anOther.porcentaje_proteinas
        end

        def initialize(nombre_plato, &block)
                #@nombre_plato = nombre_plato
                @lista_alimentos = []
                @lista_gramos = []

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

	def alimento(descripcion = {}, gramos = {})
		alimento = descripcion
		alimento << " (#{gramos[:Gramos]})" if gramos[:Gramos]
		#gramaje = gramos
		@lista_alimentos << alimento
		#@lista_gramos << gramos
	end

	def to_s
		output = @nombre_plato
		output << "\n#{'=' * @nombre_plato.size}\n\n"
		output << "Alimentos: #{@lista_alimentos.join(', ')}\n\n"
	end


end
