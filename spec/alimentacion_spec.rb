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
                @salmon = Alimentos.new("Salmon",5,4,3,6,7)
                @lista2 = Lista.new(nil,nil)
                @lista2.insert([@queso,@huevos,@carne,@salmon])

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

		it "Dieta vegetariana en un hombre" do
	                @alimento1 = Alimentos.new("Lentejas",47,104,2.8,0.4,3.4)
        	        @alimento2 = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                	@alimento3 = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
	                @alimento4 = Alimentos.new("Queso",8.33,0.43,10.99,11.0,41.0 )
        	        @alimento5 = Alimentos.new("Leche",4.21,6.12,4.08,3.2,8.9)
                	@alimento6 = Alimentos.new("Huevos",2.93,0.25,2.48,4.2,5.7)
	                @dieta3 = Lista.new(nil,nil)
        	        @dieta3.insert([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5,@alimento6])

	                expect(@dieta3.dieta_gases_diarios([200,100,100,33.3,127.5,22.5])).to eq(0.003)
        	        expect(@dieta3.dieta_gases_anuales([200,100,100,33.3,127.5,22.5])).to eq(1.21)
                	expect(@dieta3.dieta_terreno([200,100,100,33.3,127.5,22.5])).to eq(4.44)
	        end

		it "Dieta vegana en una mujer" do
	                @alimento1 = Alimentos.new("Cerveza",0.75,5.4,0.0,0.24,0.22)
        	        @alimento2 = Alimentos.new("Lentejas",32.31,71.5,1.93,0.4,3.4)
                	@alimento3 = Alimentos.new("Tofu",6.0,1.43,3.6,2.0,2.2)
	                @alimento4 = Alimentos.new("Nuez",10.55,11.08,28.50,0.3,7.9)
        	        @dieta4 = Lista.new(nil,nil)
                	@dieta4.insert([@alimento1,@alimento2,@alimento3,@alimento4])

	                expect(@dieta4.dieta_gases_diarios([150,137.5,75,52.77])).to eq(0.001)
        	        expect(@dieta4.dieta_gases_anuales([150,137.5,75,52.77])).to eq(0.26)
                	expect(@dieta4.dieta_terreno([150,137.5,75,52.77])).to eq(1.08)
	        end

		it "Dieta locura por la carne en un hombre" do
	                @alimento1 = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
        	        @alimento2 = Alimentos.new("Cerveza",0.44,3.15,0.0,0.24,0.22)
                	@alimento3 = Alimentos.new("Nuez",16.66,17.49,44.98,0.3,7.9)
	                @alimento4 = Alimentos.new("Cerdo",32.25,0.0,9.45,7.6,11.0)
        	        @alimento5 = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                	@alimento6 = Alimentos.new("Carne vaca",26.38,0.0,3.88,50.0,164.0)
	                @dieta5 = Lista.new(nil,nil)
        	        @dieta5.insert([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5,@alimento6])

                	expect(@dieta5.dieta_gases_diarios([100,87.5,83.3,150,100,125])).to eq(0.022)
        	        expect(@dieta5.dieta_gases_anuales([100,87.5,83.3,150,100,125])).to eq(8.05)
	                expect(@dieta5.dieta_terreno([100,87.5,83.3,150,100,125])).to eq(23.88)
	        end

	end

	context "Comparando alimentos en base a sus proteínas" do
                it "Operador <=" do
                        expect(@queso <= @salmon).to eq(true)
                end

		it "Operador ==" do
                        expect(@queso == @salmon).to eq(true)
                end
		
		it "Operador >=" do
                        expect(@salmon >= @queso).to eq(true)
                end

                it "Operador <" do
                        expect(@salmon < @huevos).to eq(true)
                end

                it "Operador >" do
                        expect(@queso > @carne).to eq(true)
                end

                it "Operador between?" do
                        expect(@salmon.between?(@carne,@huevos)).to eq(true)
                end

	end

	context "Enumerando listas de alimentos" do
                it "Método min" do
                        expect(@lista2.min).to eq(@carne)
                end

		it "Método max" do
                        expect(@lista2.max).to eq(@huevos)
                end

                it "Método collect" do
                        expect(@lista2.collect{ |i| i.to_s + " food" }).to eq(["(queso,5,6,7,8,9) food", "(huevos,8,7,6,5,4) food", "(carne vaca,1,2,3,5,4) food", "(Salmon,5,4,3,6,7) food"])
                end

                it "Método sort" do
                        expect(@lista2.sort).to eq([@carne,@queso,@salmon,@huevos])
                end

                it "Método select" do
                        expect(@lista2.select{ |i| i.terreno.between?(7,8)}).to eq([@salmon])
                end

                it "Método detect" do
                        expect(@lista2.detect{ |i| i.proteinas >= 6}).to eq(@huevos)
                end


        end	
end

RSpec.describe Plato do

	 before (:all) do
                @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                @queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
                @lista_alimentos = Lista.new(nil,nil)
                @lista_alimentos.insert([@pollo,@queso])
                @lista_gramos = Lista.new(nil,nil)
                @lista_gramos.insert([150,200])
                @plato = Plato.new("Pollo con queso",@lista_alimentos,@lista_gramos)

        end

	context "Probando la clase Plato" do
                it "Obteniendo el nombre de un plato" do
                        expect(@plato.nombre_plato).to eq("Pollo con queso")
                end

		it "Obteniendo el conjunto de alimentos" do
                        expect(@plato.lista_alimentos.imprimir).to eq(["(Pollo,20.6,0.0,5.6,5.7,7.1)", "(Queso,25.0,1.3,33.0,11.0,41.0)"])
                end

                it "Obteniendo el conjunto de gramos" do
                        expect(@plato.lista_gramos.imprimir).to eq(["150", "200"])
                end

		it "Obteniendo el porcentaje de proteínas" do
                        expect(@plato.porcentaje_proteinas).to eq(23.11)
                end

		it "Obteniendo el porcentaje de hidratos" do
                        expect(@plato.porcentaje_hidratos).to eq(0.74)
                end
		
		it "Obteniendo el porcentaje de lípidos" do
                        expect(@plato.porcentaje_lipidos).to eq(21.26)
                end

		it "Obteniendo valor calórico total del plato" do
                        expect(@plato.valor_calorico).to eq(1003.6)
                end
		
		 it "Obteniendo el plato formateado" do
                        expect(@plato.to_s).to eq(["Pollo con queso", "(Pollo,30.9,0.0,8.4,5.7,7.1)", 150, "(Queso,50.0,2.6,66.0,11.0,41.0)", 200])
                end

	end
end

RSpec.describe Eficiencia_Energetica do

	 before (:all) do
                @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                @queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
                @lista_alimentos = Lista.new(nil,nil)
                @lista_alimentos.insert([@pollo,@queso])
                @lista_gramos = Lista.new(nil,nil)
                @lista_gramos.insert([150,200])
                @eficiencia = Eficiencia_Energetica.new("Pollo con queso",@lista_alimentos,@lista_gramos)

                @cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
                @huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                @lista_alimentos2 = Lista.new(nil,nil)
                @lista_alimentos2.insert([@cerdo,@huevos])
                @lista_gramos2 = Lista.new(nil,nil)
                @lista_gramos2.insert([300,100])
                @eficiencia2 = Eficiencia_Energetica.new("Cerdo con huevos",@lista_alimentos2,@lista_gramos2)

        end

        context "Probando la clase Eficiencia_Energetica" do

                it "Obteniendo gases anuales" do
                        expect(@eficiencia.emisiones_gases_anuales).to eq(3.06)
                end

		it "Obteniendo gases diarios" do
                        expect(@eficiencia.emisiones_gases_diarios).to eq(0.008)
                end
		
		it "Obteniendo uso del terreno" do
                        expect(@eficiencia.uso_terreno).to eq(9.26)
                end
		
		it "Obteniendo la eficiencia energética formateada" do
                        expect(@eficiencia.to_s).to eq("( 3.06, 0.008, 9.26 )")
                end

		it "Obteniendo clase y tipo de un objeto" do
                        expect(@eficiencia.class).to eq(Eficiencia_Energetica)
                        expect(@eficiencia.instance_of?Eficiencia_Energetica).to eq(true)
                        expect(@eficiencia.instance_of?Plato).to eq(false)
                        expect(@eficiencia.is_a?Eficiencia_Energetica).to eq(true)
                        expect(@eficiencia.is_a?Object).to eq(true)
                        expect(@eficiencia.is_a?BasicObject).to eq(true)
                        expect(@eficiencia.kind_of?Eficiencia_Energetica).to eq(true)
                end

	end

	context "Comparando distintos platos" do
                it "Platos de la dieta española" do
                        #PRIMER PLATO
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @salmon = Alimentos.new("Salmón",19.9,0.0,13.6,6.0,3.7)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@salmon])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([200,250])
                        @plato = Plato.new("Lentejas con salmón",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con salmón",@lista, @gramos )

                        #SEGUNDO PLATO
                        @chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                        @huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@chocolate,@huevos])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([200,150])
                        @plato2 = Plato.new("Huevos con chocolate",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Huevos con chocolate",@lista2, @gramos2 )

                        expect(@plato <= @plato2).to eq(false)
                        expect(@eficiencia > @eficiencia2).to eq(true)

                end

		it "Platos de la dieta vasca" do

                        #PRIMER PLATO
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @leche = Alimentos.new("Leche",3.3,4.8,3.2,3.2,8.9)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@leche])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([400,100])
                        @plato = Plato.new("Lentejas con leche",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con leche",@lista, @gramos )

                        #SEGUNDO PLATO
                        @chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                        @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@chocolate,@pollo])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([150,300])
                        @plato2 = Plato.new("Pollo con chocolate",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Pollo con chocolate",@lista2, @gramos2 )

                        expect(@plato <= @plato2).to eq(false)
                        expect(@eficiencia > @eficiencia2).to eq(false)

                end

		 it "Platos de la dieta vegetariana" do

                        #PRIMER PLATO
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@huevos])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([350,100])
                        @plato = Plato.new("Lentejas con huevos",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con huevos",@lista, @gramos )

                        #SEGUNDO PLATO
                        @leche = Alimentos.new("Leche",3.3,4.8,3.2,3.2,8.9)
                        @nueces = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@leche,@nueces])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([150,300])
                        @plato2 = Plato.new("Leche con nueces",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Leche con nueces",@lista2, @gramos2 )

                        expect(@plato <= @plato2).to eq(false)
                        expect(@eficiencia > @eficiencia2).to eq(false)

                end

		it "Platos de la dieta vegana" do

                        #PRIMER PLATO
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@cerveza])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([200,250])
                        @plato = Plato.new("Lentejas con cervezas",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con cerveza",@lista, @gramos )

                        #SEGUNDO PLATO
                        @tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                        @nueces = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@tofu,@nueces])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([300,150])
                        @plato2 = Plato.new("Tofu con nueces",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Tofu con nueces",@lista2, @gramos2 )

                        expect(@plato <= @plato2).to eq(true)
                        expect(@eficiencia > @eficiencia2).to eq(false)

                end

		it "Platos de la dieta locura por la carne" do

                        #PRIMER PLATO
                        @cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
                        @cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@cerdo,@cerveza])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([350,150])
                        @plato = Plato.new("Cerdo con cerveza",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Cerdo con cerveza",@lista, @gramos )

                        #SEGUNDO PLATO
                        @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@pollo,@lentejas])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([300,200])
                        @plato2 = Plato.new("Pollo con lentejas",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Pollo con lentejas",@lista2, @gramos2 )

                        expect(@plato <= @plato2).to eq(true)
                        expect(@eficiencia > @eficiencia2).to eq(false)

                end

	end

	context "Enumerando platos" do
                it "Platos de la dieta española" do
			@lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @salmon = Alimentos.new("Salmón",19.9,0.0,13.6,6.0,3.7)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@salmon])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([200,250])
                        @plato = Plato.new("Lentejas con salmón",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con salmón",@lista, @gramos )
			expect(@eficiencia.lista_alimentos.min).to eq(@salmon)
			expect(@eficiencia.lista_alimentos.max).to eq(@lentejas)			
			expect(@eficiencia.lista_alimentos.collect{ |i| i.to_s}).to eq(["(Lentejas,23.5,52.0,1.4,0.4,3.4)", "(Salmón,19.9,0.0,13.6,6.0,3.7)"])
			expect(@eficiencia.lista_alimentos.select{ |i| i.terreno > 3}).to eq([@lentejas,@salmon])
			expect(@eficiencia.lista_alimentos.sort).to eq([@salmon,@lentejas])
                end

		it "Platos de la dieta vasca" do
			@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                        @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@chocolate,@pollo])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([150,300])
                        @plato2 = Plato.new("Pollo con chocolate",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Pollo con chocolate",@lista2, @gramos2 )
			expect(@eficiencia2.lista_alimentos.min).to eq(@chocolate)
                        expect(@eficiencia2.lista_alimentos.max).to eq(@pollo)
			expect(@eficiencia2.lista_alimentos.collect{ |i| i.to_s}).to eq(["(Chocolate,5.3,47.0,30.0,2.3,3.4)", "(Pollo,20.6,0.0,5.6,5.7,7.1)"])
                        expect(@eficiencia2.lista_alimentos.select{ |i| i.gei > 2}).to eq([@chocolate,@pollo])
                        expect(@eficiencia2.lista_alimentos.sort).to eq([@chocolate,@pollo])
		end

		it "Platos de la dieta vegetariana" do
			@leche = Alimentos.new("Leche",3.3,4.8,3.2,3.2,8.9)
                        @nueces = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
			@lista2 = Lista.new(nil,nil)
                        @lista2.insert([@nueces,@leche])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([150,300])
                        @plato2 = Plato.new("Leche con nueces",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Leche con nueces",@lista2, @gramos2 )
			expect(@eficiencia2.lista_alimentos.min).to eq(@leche)
                        expect(@eficiencia2.lista_alimentos.max).to eq(@nueces)
                        expect(@eficiencia2.lista_alimentos.collect{ |i| i.to_s}).to eq(["(Nuez,20.0,21.0,54.0,0.3,7.9)", "(Leche,3.3,4.8,3.2,3.2,8.9)"])
                        expect(@eficiencia2.lista_alimentos.select{ |i| i.lipidos > 5}).to eq([@nueces])
                        expect(@eficiencia2.lista_alimentos.sort).to eq([@leche,@nueces])
		end

		it "Platos de la dieta vegana" do
			@tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                        @nueces = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@tofu,@nueces])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([300,150])
                        @plato2 = Plato.new("Tofu con nueces",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Tofu con nueces",@lista2, @gramos2 )
			expect(@eficiencia2.lista_alimentos.min).to eq(@tofu)
                        expect(@eficiencia2.lista_alimentos.max).to eq(@nueces)
                        expect(@eficiencia2.lista_alimentos.collect{ |i| i.to_s}).to eq(["(Tofu,8.0,1.9,4.8,2.0,2.2)", "(Nuez,20.0,21.0,54.0,0.3,7.9)"])
                        expect(@eficiencia2.lista_alimentos.select{ |i| i.hidratos > 5}).to eq([@nueces])
                        expect(@eficiencia2.lista_alimentos.sort).to eq([@tofu,@nueces])
		end

		it "Platos de la dieta locura por la carne" do
			@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
                        @cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@cerdo,@cerveza])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([350,150])
                        @plato = Plato.new("Cerdo con cerveza",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Cerdo con cerveza",@lista, @gramos )
			expect(@eficiencia.lista_alimentos.min).to eq(@cerveza)
                        expect(@eficiencia.lista_alimentos.max).to eq(@cerdo)
                        expect(@eficiencia.lista_alimentos.collect{ |i| i.to_s}).to eq(["(Cerdo,21.5,0.0,6.3,7.6,11.0)", "(Cerveza,0.5,3.6,0.0,0.24,0.22)"]
)
                        expect(@eficiencia.lista_alimentos.select{ |i| i.proteinas > 5}).to eq([@cerdo])
                        expect(@eficiencia.lista_alimentos.sort).to eq([@cerveza,@cerdo])
		end


	end

	context "Creando un menú dietético" do
                before (:all) do
                 #PRIMER PLATO
                        @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
                        @salmon = Alimentos.new("Salmón",19.9,0.0,13.6,6.0,3.7)
                        @lista = Lista.new(nil,nil)
                        @lista.insert([@lentejas,@salmon])
                        @gramos = Lista.new(nil,nil)
                        @gramos.insert([200,250])
                        @plato = Plato.new("Lentejas con salmón",@lista, @gramos )
                        @eficiencia = Eficiencia_Energetica.new("Lentejas con salmón",@lista, @gramos )

                        #SEGUNDO PLATO
                        @chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                        @huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
                        @lista2 = Lista.new(nil,nil)
                        @lista2.insert([@chocolate,@huevos])
                        @gramos2 = Lista.new(nil,nil)
                        @gramos2.insert([200,150])
                        @plato2 = Plato.new("Huevos con chocolate",@lista2,@gramos2)
                        @eficiencia2 = Eficiencia_Energetica.new("Huevos con chocolate",@lista2, @gramos2 )


                        #TERCER PLATO
                        @tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                        @nueces = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
                        @lista3 = Lista.new(nil,nil)
                        @lista3.insert([@tofu,@nueces])
                        @gramos3 = Lista.new(nil,nil)
                        @gramos3.insert([300,150])
                        @plato3 = Plato.new("Tofu con nueces",@lista3,@gramos3)
                        @eficiencia3 = Eficiencia_Energetica.new("Tofu con nueces",@lista3, @gramos3 )
      
      			@menu = [@eficiencia,@eficiencia2,@eficiencia3]
			@precios = [11.50,3.50,8.25]
		end

		it "Calculando la huella nutricional" do
			expect(@eficiencia.huella_nutricional).to eq(3.0)
                        expect(@eficiencia2.huella_nutricional).to eq(2.5)
                        expect(@eficiencia3.huella_nutricional).to eq(2.0)
			expect(@menu.max).to eq(@eficiencia)
		end

		it "Modificando el precio de los platos" do
			aux=@menu.index(@menu.max)   		#obtenemos del plato con mayor huella su índice en el vector
                        proporcion = 0.5*@precios[aux]		#calculamos la cantidad que sumaremos al precio de cada plato
			nuevo_precio = []
			@precios.collect{ |i| nuevo_precio << i + proporcion}
			expect(nuevo_precio).to eq([17.25, 9.25, 14.0])
		end
	end

end

RSpec.describe Plato_DSL do
	context "Probando el DSL" do
		it "Probando la clase Plato_DSL" do
			plato = Plato_DSL.new("Hamburguesa") do
				nombre "Hamburguesa especial de la casa"
			end
		       
		end
	end
end
