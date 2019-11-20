Nodo = Struct.new(:value, :next, :prev)
class Lista
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

end
