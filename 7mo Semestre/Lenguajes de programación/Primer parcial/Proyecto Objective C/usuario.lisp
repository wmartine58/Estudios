(when in
			(loop for line = (read-line in nil)
				while line do (format t "~a~%" line))
			(close in)
        )
	)
)

(defun menuPrincipal()
	(format t "~%     Menu Principal~% [1] Ingresar usuarios~% [2] Imprimir usuarios~%")
	(setq entrada(read))
	(if entrada
		ingresarUsuario()
	)
	imprimirUsuario()
)

(defun main()
	(menuPrincipal)
)