RSpec.describe Alimentos do
	before (:all) do
		@alimento1 = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
		@alimento2 = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
		@alimento3 = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
		@alimento4 = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
		@alimento5 = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
	end
	context "Probando los getters" do
	it "Devolviendo el nombre del alimento" do
		expect(@alimento1.nombre).to eq("Chocolate")
		expect(@alimento2.nombre).to eq("Cerdo")
		expect(@alimento3.nombre).to eq("Pollo")
		expect(@alimento4.nombre).to eq("Queso")
		expect(@alimento5.nombre).to eq("Huevos")
	end

	it "Devolviendo las proteinas del alimento" do
                 expect(@alimento1.proteinas).to eq(5.3)
                 expect(@alimento2.proteinas).to eq(21.5)
                 expect(@alimento3.proteinas).to eq(20.6)
                 expect(@alimento4.proteinas).to eq(25.0)
                 expect(@alimento5.proteinas).to eq(13.0)
        end

	it "Devolviendo los carbohidratos del alimento" do
                  expect(@alimento1.hidratos).to eq(47.0)
                  expect(@alimento2.hidratos).to eq(0.0)
                  expect(@alimento3.hidratos).to eq(0.0)
                  expect(@alimento4.hidratos).to eq(1.3)
                  expect(@alimento5.hidratos).to eq(1.1)
        end

	it "Devolviendo los lípidos del alimento" do
                  expect(@alimento1.lipidos).to eq(30.0)
                  expect(@alimento2.lipidos).to eq(6.3)
                  expect(@alimento3.lipidos).to eq(5.6)
                  expect(@alimento4.lipidos).to eq(33.0)
                  expect(@alimento5.lipidos).to eq(11.0)
        end

	it "Devolviendo los gases del alimento" do
                  expect(@alimento1.gei).to eq(2.3)
                  expect(@alimento2.gei).to eq(7.6)
                  expect(@alimento3.gei).to eq(5.7)
                  expect(@alimento4.gei).to eq(11.0)
                  expect(@alimento5.gei).to eq(4.2)
        end

	it "Devolviendo el uso de terreno del alimento" do
                  expect(@alimento1.terreno).to eq(3.4)
                  expect(@alimento2.terreno).to eq(11.0)
                  expect(@alimento3.terreno).to eq(7.1)
                  expect(@alimento4.terreno).to eq(41.0)
                  expect(@alimento5.terreno).to eq(5.7)
        end
	end

	it "Devolviendo el alimento formateado" do
		expect(@alimento1.to_s).to eq("(Chocolate,5.3,47.0,30.0,2.3,3.4)")
		expect(@alimento2.to_s).to eq("(Cerdo,21.5,0.0,6.3,7.6,11.0)")
		expect(@alimento3.to_s).to eq("(Pollo,20.6,0.0,5.6,5.7,7.1)")
		expect(@alimento4.to_s).to eq("(Queso,25.0,1.3,33.0,11.0,41.0)")
		expect(@alimento5.to_s).to eq("(Huevos,13.0,1.1,11.0,4.2,5.7)")
	end

	it "Probando el método valor_energetico" do
		expect(@alimento1.valor_energetico).to eq(479.2)
		expect(@alimento2.valor_energetico).to eq(142.7)
		expect(@alimento3.valor_energetico).to eq(132.8)
		expect(@alimento4.valor_energetico).to eq(402.2)
		expect(@alimento5.valor_energetico).to eq(155.4)
	end

	context "Calculando los impactos ambientales" do
		it "Calculando el impacto ambiental de un hombre" do
			expect(@alimento5.impacto_hombre(100)).to eq([6.02,17.34])
		end

		it "Calculando el impacto ambiental de una mujer" do
			expect(@alimento5.impacto_mujer(125,50,56.81,94.34,181.81)).to eq([2.09,2.72])
                end

	end

end

RSpec.describe Lista do
	before (:all) do
                @nodo = Nodo.new(1,nil,nil)
		@lista = Lista.new(nil,nil)
		@carne = Alimentos.new("carne vaca",1,2,3,5,4)
                @queso = Alimentos.new("queso",5,6,7,8,9)
                @huevos = Alimentos.new("huevos",8,7,6,5,4)

	end

	it "Probando la estructura del nodo" do
		expect(@nodo.value).to eq(1)
                expect(@nodo.next).to eq(nil)
                expect(@nodo.prev).to eq(nil)
	end

	context "Probando la lista doblemente enlazada" do

		it "Probando el método insert_head y los getters" do
        	        @lista.insert_head(@carne)
                	expect(@lista.head[:value].nombre).to eq("carne vaca")
 	                expect(@lista.head[:value].lipidos).to eq(3)
	        end

		it "Probando el método insert_tail" do
                        @lista.insert_tail(@queso)
	                expect(@lista.tail[:value].nombre).to eq("queso")
        	        expect(@lista.tail[:value].proteinas).to eq(5)                                  
                end

		it "Probando el método extract_head" do
			@lista.extract_head()
	                expect(@lista.head[:value].nombre).to eq("queso")
		end

		it "Probando el método extract_tail" do
			@lista.insert_head(@carne)
	                @lista.extract_tail()
        	        expect(@lista.head[:value].nombre).to eq("carne vaca")
                	@lista.extract_head()      #vaciamos la lista para las pruebas siguientes
		end

		it "Probando el método insert" do
			@lista.insert([@carne,@queso,@huevos])
        	        expect(@lista.head[:value].nombre).to eq("carne vaca")
	                expect(@lista.tail[:value].nombre).to eq("huevos")
		end
	end
	
end
