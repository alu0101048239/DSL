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


end
