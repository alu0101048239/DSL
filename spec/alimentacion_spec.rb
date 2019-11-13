RSpec.describe Alimentos do
	before (:all) do
		@alimento1 = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
		@alimento2 = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
		@alimento3 = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
		@alimento4 = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
		@alimento5 = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
	end

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

end
