class Plato_DSL

	attr_reader :nombre_plato, :lista_alimentos, :lista_gramos
        include Comparable
        def <=>(anOther)
                self.porcentaje_proteinas <=> anOther.porcentaje_proteinas
        end

        def initialize(nombre_plato, &block)
                @nombre_plato = nombre_plato
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

end
