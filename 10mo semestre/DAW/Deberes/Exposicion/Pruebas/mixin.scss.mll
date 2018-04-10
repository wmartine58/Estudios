@mixin boton {
  font-size: 24px;
  padding: .5em .8em;
  border-radius: 3px;
  border: none;
  cursor: pointer;
}
.boton-principal {
  @include boton;
  background: #0BE66A;
}
.boton-secundario {
  @include boton;
  background: #DDDDDD;
}