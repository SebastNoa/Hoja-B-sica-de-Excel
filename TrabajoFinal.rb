class Nodo

    #El nodo sería la celda
    attr_accessor :valor, :enlaceNodo

    def initialize(valor:)

        @valor = valor
        @enlaceNodo = nil
    end

    def valorNodo
        print("#{valor}\t")
    end

end

class Fila

    attr_accessor :primNodo , :ultNodo , :enlaceFila

    def initialize()

        @primNodo = nil
        @ultNodo = nil
        @enlaceFila = nil
    end

    def nodoFinal()

        nodo = Nodo.new(valor: 0) #Los nodos/celdas por defecto son 0

        if @primNodo == nil
            @primNodo = nodo
            @ultNodo = @primNodo
        else
            @ultNodo.enlaceNodo = nodo
            @ultNodo = nodo
        end
    end

    def agregarColumnas(col:)

        for i in 1..col do
            nodoFinal()
        end

    end

    def verFila()

        temp = @primNodo

        while !(temp.nil?)
            temp.valorNodo()
            temp = temp.enlaceNodo
        end
        puts ""
    end

    def posicionColumna(pos:)

        temp = @primNodo
        cont = 1
        while !(temp.nil?)
            if cont == pos
                return temp
            end
            temp = temp.enlaceNodo
            cont = cont + 1
        end
        return nil
    end
end

class Hoja

    attr_accessor :primFila, :cantFilas, :cantColumnas 

    def initialize()

        fila = Fila.new()
        fila.nodoFinal()
        @primFila = fila
        @cantFilas = 1
        @cantColumnas = 1
        
    end

    
    def crearHoja()

        print "Hoja\n" 
        temp = @primFila
        
        while !(temp.nil?)
            temp.verFila()
            temp = temp.enlaceFila
        end

    end
    
    def crearNuevaFila()

        fila = Fila.new()
        fila.agregarColumnas(col: @cantColumnas)
        if @primFila == nil
            @primFila = fila
        else 
            temp = @primFila
            while !(temp.enlaceFila.nil?)
                temp = temp.enlaceFila
            end
            temp.enlaceFila = fila
        end
        @cantFilas = @cantFilas + 1
    end
    
    def crearNuevaCol()

        temp = @primFila
        while !(temp.nil?)
            temp.nodoFinal()
            temp = temp.enlaceFila
        end
        @cantColumnas = @cantColumnas + 1
    end

    def posicionFila(pos:)

        temp = @primFila
        cont = 1
        while !(temp.nil?)
            if cont == pos
                return temp
            end
            temp = temp.enlaceFila
            cont = cont + 1
        end
        return nil
    end

    def agregarValor(fila: , col: , val:)

        if fila > @cantFilas || col > @cantColumnas || fila <= 0 || col <= 0
            print "La posicion no existe\n"
        else
            fila = posicionFila(pos: fila)
            nodo = fila.posicionColumna(pos: col)
            nodo.valor = val
        end
    end

    def obtenerNodo(fila: , col:)
        if fila > @cantFilas || col > @cantColumnas || fila <= 0 || col <= 0
            print "La posicion no existe\n"
            return nil
        else
            fila = posicionFila(pos: fila)
            nodo = fila.posicionColumna(pos: col)
            return nodo
        end
    end

    def Suma(posfila1:, poscol1:, posfila2: ,poscol2:)

        if posfila1 > @cantFilas || poscol1 > cantColumnas || posfila1 <= 0 || poscol1 <= 0
            print "La posicion no existe\n"
            return 0
        end

        if posfila2 > @cantFilas || poscol2 > cantColumnas || posfila2 <= 0 || poscol2 <= 0
            print "La posicion no existe\n"
            return 0
        end

        sum = 0
        for i in posfila1..posfila2
            for j in poscol1..poscol2
                nodo = obtenerNodo(fila:i ,col: j)
                sum = sum + nodo.valor
            end
        end
        print "La suma de los elementos del rango (" + posfila1.to_s + "," + poscol1.to_s + ") al (" + posfila2.to_s + "," + poscol2.to_s + ") es: " + sum.to_s + "\n"
        return sum
    end
    
    def promedioNodos(posfila1:, poscol1:, posfila2: ,poscol2:)
        if posfila1 > @cantFilas || poscol1 > cantColumnas || posfila1 <= 0 || poscol1 <= 0
            print "La posicion no existe\n"
            return 0
        end
        if posfila2 > @cantFilas || poscol2 > cantColumnas || posfila2 <= 0 || poscol2 <= 0
            print "La posicion no existe\n"
            return 0
        end
        sum = 0
        cont = 0
        for i in posfila1..posfila2
            for j in poscol1..poscol2
                nodo = obtenerNodo(fila: i , col: j)
                cont = cont + 1
                sum = sum + nodo.valor
            end
        end
        if cont == 0
            print "Ingrese una posicion correcta \n"
            return 0
        end
        if
            print "El promedio de los elementos del rango (" + posfila1.to_s + "," + poscol1.to_s + ") al (" + posfila2.to_s + "," + poscol2.to_s + ") es: " + (sum/cont).to_s + "\n"
            return 0
        end
        return sum/cont
    end
end

hoja = Hoja.new() 

hoja.crearHoja()

hoja.crearNuevaCol()
hoja.crearNuevaCol()
hoja.crearNuevaFila()
hoja.crearNuevaFila()
hoja.crearNuevaFila()

hoja.agregarValor(col: 3, fila: 2, val: 10)
hoja.agregarValor(col: 1, fila: 3, val: 5)
hoja.agregarValor(col: 2, fila: 1, val: 8)
hoja.agregarValor(col: 3, fila: 3, val: 5)

hoja.crearHoja()

suma = hoja.Suma(posfila1: 1 , poscol1: 2 , posfila2: 2 , poscol2: 3)

promedio = hoja.promedioNodos(posfila1: 1 , poscol1: 2 , posfila2: 1 , poscol2: 3)