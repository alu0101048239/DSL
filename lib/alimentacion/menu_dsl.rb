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

	def componente(descripcion, precio = {})
		componente = "\n - " + descripcion
		componente << " || Precio: #{precio[:Precio]} euros " if precio[:Precio]
		@lista_platos << componente
	end

	def to_s
		output = @nombre_menu
		output << "\n#{'=' * @nombre_menu.size}\n\n"
                output << "Platos: \n #{@lista_platos.join(' ')}\n\n"
	end




end
