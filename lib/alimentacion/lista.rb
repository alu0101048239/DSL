Nodo = Struct.new(:value, :next, :prev)
class Lista
	include Enumerable

        def each
                aux = @head
                while !aux.nil?
                        yield aux[:value]
                        aux = aux[:next]
                end
        end

	attr_accessor :head,:tail
        def initialize(head,tail)
                @head = nil
                @tail = nil
        end

	def insert_head(value)
                if @head.nil?
                        @head = Nodo.new(value, nil, nil)
                        @tail = @head
                else
                        @head[:prev] = Nodo.new(value, @head, nil)
                        @head = @head[:prev]
                end
        end

	def insert_tail(value)
                if @head.nil?
                        @head = Nodo.new(value, nil, nil)
                        @tail = @head
                else
                        @tail[:next] = Nodo.new(value, nil, @tail)
                        @tail = @tail[:next]
                end
        end
	
	def extract_head()
                if @head.nil?
                        raise RuntimeError, "La lista está vacía"
                else
                        if @head == @tail
                                @head, @tail = nil
                        else
                                @head = @head[:next]
                                @head[:prev] = nil
                        end

                end
        end

	def extract_tail()
                if @head.nil?
                        raise RuntimeError, "La lista está vacía"
                else
                        if @head == @tail
                                @head, @tail = nil
                        else
                                @tail = @tail[:prev]
                                @tail[:next] = nil
                        end
                end
        end

	def insert(nodos)
            for i in (0.. nodos.size-1)
                insert_tail(nodos[i])
            end
        end

	def imprimir
                aux = @head
                lista = []
                while (!aux.nil?)
                        lista << aux[:value].to_s
                        aux = aux[:next]
                end
        return lista

        end

	def dieta_gases_anuales(gramos)
                aux = @head
                suma_gases = 0
                i = 0
                while (!aux.nil?)
                        suma_gases += aux[:value].auxiliar(gramos[i])
                        aux = aux[:next]
                        i = i+1
                end
                return suma_gases.round(2)

        end

	def dieta_gases_diarios(gramos)
                gases_diarios = dieta_gases_anuales(gramos)/365
                return gases_diarios.round(3)
        end

	def dieta_terreno(gramos)

                aux = @head
                suma_terreno = 0
                i = 0
                while (!aux.nil?)
                        suma_terreno += aux[:value].auxiliar2(gramos[i])
                        aux = aux[:next]
                        i = i+1
                end
                return suma_terreno.round(2)

        end

end
