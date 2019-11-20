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

		it "Probando el método imprimir" do
			expect(@lista.imprimir).to eq(["(carne vaca,1,2,3,5,4)", "(queso,5,6,7,8,9)", "(huevos,8,7,6,5,4)"])
		end
	end

	context "Probando las cinco dietas" do

		it "Dieta española en un hombre" do
	                @alimento1 = Alimentos.new("Chocolate",7.95,70.5,45,2.3,3.4)
        	        @alimento2 = Alimentos.new("Lentejas",35.25,78,2.1,0.4,3.4)
                	@alimento3 = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
	                @alimento4 = Alimentos.new("Nuez",6.6,6.93,17.82,0.3,7.9)
        	        @alimento5 = Alimentos.new("Pollo",10.3,0.0,2.8,5.7,7.1)
                	@alimento6 = Alimentos.new("Cerdo",10.75,0.0,3.15,7.6,11.0)
	                @alimento7 = Alimentos.new("Camarones",8.8,0.75,0.3,18.0,2.0)
        	        @dieta1 = Lista.new(nil,nil)
                	@dieta1.insert([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5,@alimento6,@alimento7])

	                expect(@dieta1.dieta_gases_anuales([150,150,100,33,50,50,50])).to eq(3.08)
			expect(@dieta1.dieta_gases_diarios([150,150,100,33,50,50,50])).to eq(0.008)
			expect(@dieta1.dieta_terreno([150,150,100,33,50,50,50])).to eq(6.39)
		end

		it "Dieta vasca en una mujer" do
                	@alimento1 = Alimentos.new("Cerveza",1.0,7.2,0.0,0.24,0.22)
	                @alimento2 = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        	        @alimento3 = Alimentos.new("Nuez",9,9.45,24.3,0.3,7.9)
                	@alimento4 = Alimentos.new("Carne cordero",11.48,0.0,10.85,20.0,185.0 )
	                @alimento5 = Alimentos.new("Salmón",17.16,0.0,11.73,6.0,3.7)
        	        @dieta2 = Lista.new(nil,nil)
                	@dieta2.insert([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5])

	                expect(@dieta2.dieta_gases_diarios([200,100,45,63.8,86.25])).to eq(0.006)
        	        expect(@dieta2.dieta_gases_anuales([200,100,45,63.8,86.25])).to eq(2.09)
                	expect(@dieta2.dieta_terreno([200,100,45,63.8,86.25])).to eq(12.86)
	        end

	end


	
end
