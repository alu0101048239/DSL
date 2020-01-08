class Menu_DSL
attr_reader :nombre_menu, :lista_platos, :precio_menu

	def initialize (nombre_menu, &block)
		#@nombre_menu = nombre_menu
		@lista_platos = []
		@precios_menu = []

		if block_given?
                        if block.arity == 1
                                yield self
                        else
                                instance_eval(&block)
                        end
                end
	end

	def descripcion(n)
		@nombre_menu = n
	end

end
