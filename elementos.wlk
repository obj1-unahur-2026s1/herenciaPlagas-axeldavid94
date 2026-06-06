import plaga.*
class Hogar {
    var  nivelDeMugre
    const  confortOfrecido
    method esBueno() = nivelDeMugre  <= confortOfrecido / 2
    method recibirAtaqueDe(unaPlaga){
        nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDanio()
    }
    
}
class Huerta {
    var produccion

    method esBueno() = produccion > capacidadFija.nivelDeProduccion()
    method recibirAtaqueDe(unaPlaga){
        produccion = produccion - (unaPlaga.nivelDeDanio() * 0.1 + if(unaPlaga.transmiteEnfermedad()) 10 else 0)
    }
}

class Mascota {
    var nivelDeSalud

    method esBueno() = nivelDeSalud > 250

    method recibirAtaqueDe(unaPlaga){
        if (unaPlaga.transmiteEnfermedad())
            nivelDeSalud = (nivelDeSalud - unaPlaga.nivelDeDanio()) 
    }
}

object capacidadFija {
    var property nivelDeProduccion = 10
}

class Barrio {
    const property elementos = []

    method agregarElemento(unElemento){
        elementos.add(unElemento)
    }
    method esCopado() = self.cantidadDeElementosBuenos() > elementos.size() / 2
    method cantidadDeElementosBuenos() = elementos.count({ e => e.esBueno()})
}