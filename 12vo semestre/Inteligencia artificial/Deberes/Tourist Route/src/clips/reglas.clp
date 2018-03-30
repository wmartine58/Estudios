(deftemplate Nodo
	(slot origen)
	(slot detener)
	(slot destino-1)
	(slot distancia-1)
	(slot destino-2)
	(slot distancia-2)
	(slot destino-3)
	(slot distancia-3)
)

(defrule empezar
	(declare (salience 1))
	=>
	(printout t "Hill Climbing" crlf)
)

(defrule inicio
	(not (Nodo (origen nodo-1)))
	=>
	(loads-facts "clips/base.dat")
	(assert nodo-actual nodo-1)
)

(defrule preguntar-Nodo-r-1
	(nodo-actual ?actual)
	(Nodo (origen ?origen))
	 ?n <- (Nodo {detener == no && distancia-2 == nil && distancia-3 == nil})
	=>
		assert (nodo-actual n.destino-1))
)

(defrule preguntar-Nodo-r-2-1
	(nodo-actual ?actual)
	(Nodo (origen ?origen) (distancia-1 ?d-1) (distancia-2 ?d-2))
	?n-1 <- (Nodo {detener == no && distancia-3 == nil && distancia-1 <= distancia-2})
	=>
		(assert (nodo-actual n.destino-1))
)

(defrule preguntar-Nodo-r-2-2
	(nodo-actual ?actual)
	?n <- (Nodo {detener == no && distancia-3 == nil && distancia-1 > distancia-2})
	=>
		(assert (nodo-actual n.destino-2))
)

(defrule preguntar-Nodo-r-3-1
	(nodo-actual ?actual)
	?n <- (Nodo {detener == no && distancia-1 <= distancia-2 && distancia-1 <= distancia-3})
	=>
		(assert (nodo-actual n.destino-1))
)

(defrule preguntar-Nodo-r-3-2
	(nodo-actual ?actual)
	?n <- (Nodo {detener == no && distancia-1 > distancia-2 && distancia-2 <= distancia-3})
	=>
		(assert (nodo-actual n.destino-2))
)

(defrule preguntar-Nodo-r-3-3
	(nodo-actual ?actual)
	?n <- (Nodo {detener == no && distancia-1 > distancia-3 && distancia-2 > distancia-3})
	=>
		(assert (nodo-actual n.destino-3))
)
