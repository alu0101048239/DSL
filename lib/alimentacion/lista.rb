Nodo = Struct.new(:value, :next, :prev)
class Lista
	attr_accessor :head,:tail
        def initialize(head,tail)
                @head = nil
                @tail = nil
        end

end
