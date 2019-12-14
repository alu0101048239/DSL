# encoding: utf-8
# Esta clase implementa una lista doblemente enlazada.
# Se desarrollan los métodos para insertar y extraer nodos por la cabeza y por la cola, e imprimir la lista completa.
# Se utiliza una estructura para representar los nodos, con los valores value, next y prev.
#
# Author::      David Hernández Suárez (mailto:david@alimentos)
# Copyright::   Cretive Commons
# License::     Distributes under the same terms as Ruby

Nodo = Struct.new(:value, :next, :prev)
class Lista
	include Enumerable

	# Se utiliza el módulo Enumerable, para enumerar cualquier lista enlazada.
        def each
                aux = @head
                while !aux.nil?
                        yield aux[:value]
                        aux = aux[:next]
                end
        end

	attr_accessor :head,:tail

	# Se asignan la cabecera de la lista y la cola de la lista. Inicialmente apuntan a nil.
        def initialize(head,tail)
                @head = nil
                @tail = nil
        end

	# Se inserta un nodo por la cabeza de la lista
	def insert_head(value)
                if @head.nil?
                        @head = Nodo.new(value, nil, nil)
                        @tail = @head
                else
                        @head[:prev] = Nodo.new(value, @head, nil)
                        @head = @head[:prev]
                end
        end

	# Se inserta un nodo por la cola de la lista
	def insert_tail(value)
                if @head.nil?
                        @head = Nodo.new(value, nil, nil)
                        @tail = @head
                else
                        @tail[:next] = Nodo.new(value, nil, @tail)
                        @tail = @tail[:next]
                end
        end

	# Se extrae el nodo situado en la cabeza de la lista
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

	# Se extrae el nodo situado en la cola de la lista
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

	# Se insertan por la cola un conjunto de nodos
	def insert(nodos)
            for i in (0.. nodos.size-1)
                insert_tail(nodos[i])
            end
        end

	# Se visualiza la lista
	def imprimir
                aux = @head
                lista = []
                while (!aux.nil?)
                        lista << aux[:value].to_s
                        aux = aux[:next]
                end
        return lista

        end

	# Calcula el total de gases anuales que tiene la lista de alimentos
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

	# Calcula el total de gases diarios que tiene la lista de alimentos
	def dieta_gases_diarios(gramos)
                gases_diarios = dieta_gases_anuales(gramos)/365
                return gases_diarios.round(3)
        end

	# Calcula el total de uso del terreno que tiene la lista de alimentos
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
