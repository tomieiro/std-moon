<h1>Lua Data Structures</h1>
Biblioteca para Linguagem Lua que implementa estruturas de dados mais utilizadas.

<p>
  <img src="https://www.andreas-rozek.de/Lua/Lua-Logo_32x32.png" alt="lua_logo"/ align=center>  Lua: https://www.lua.org/
</p>
  

<h3>Motivacao</h3>
<p></p>

<h3>Contribuicao</h3>
<p></p>

<h3>Utilizacao</h3>
<p></p>

<h3>Documentacao</h3>
<h4>Arvore binaria</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>AVL</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Fila de Prioridade (Heap)</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>


<h4>Fila</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura basica de fila. Estrutura que segue a logica FIFO(first in, first out).</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li>Fila:new(args)
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Fila.</li>
          <li>Argumentos: (Table) Atributos desejados para a Fila.</li>
          <li>Retorno: (Object) Fila instanciada.</li>
        </ul>
      </li>
      <li>Fila:push(args)
        <ul>
          <li>Descricao: Metodo push que insere um objeto na Fila.</li>
          <li>Argumentos: (Object) Objeto desejados para incluir na Fila.</li>
        </ul>
      </li>
      <li>Fila:pop()
        <ul>
          <li>Descricao: Metodo pop que remove um objeto da Fila.</li>
          <li>Retorno: (Object) Objeto removida da Fila.</li>
        </ul>
      </li>
      <li>Fila:free()
        <ul>
          <li>Descricao: Metodo para liberar a Fila.</li>
        </ul>
      </li>
    </ul> 
    <p>...</p>
  </div>
</div>
<h4>Exemplo</h4>

```lua
local Fila = require("fila");
local nova_fila = Fila:new();
nova_fila:push("Primeiro_Elemento");
nova_fila:push("Segundo_Elemento");
local elemento_extraido = nova_fila:pop();
print(elemento_extraido);
nova_fila:free();
```
<hr>

<h4>Grafo</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Hash</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Lista</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Mapa</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Matriz</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Pilha</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>...</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
require("Open");
```
<hr>

<h4>Vetor</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura basica de fila. Estrutura que segue a logica FIFO(first in, first out).</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li>Vetor:new(args)
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Vetor.</li>
          <li>Argumentos: (Table) Atributos desejados para o Vetor.</li>
          <li>Retorno: (Object) Vetor instanciado.</li>
        </ul>
      </li>
      <li>Vetor:insert(objeto)
        <ul>
          <li>Descricao: Metodo insert que insere um objeto no Vetor.</li>
          <li>Argumentos: (Object) Objeto desejados para incluir no Vetor.</li>
        </ul>
      </li>
      <li>Vetor:at(index)
        <ul>
          <li>Descricao: Metodo at que acessa um objeto do Vetor.</li>
          <li>Argumentos: (Int) Indice qual se deseja acessar</li>
          <li>Retorno: (Object) Objeto acessado do Vetor.</li>
        </ul>
      </li>
      <li>Vetor:front()
        <ul>
          <li>Descricao: Metodo front que acessa o primeiro objeto do Vetor.</li>
          <li>Retorno: (Object) Objeto da primeira posicao do Vetor.</li>
        </ul>
      </li>
      <li>Vetor:back()
        <ul>
          <li>Descricao: Metodo back que acessao ultimo objeto do Vetor.</li>
          <li>Retorno: (Object) Objeto da ultima posicao do Vetor.</li>
        </ul>
      </li>
      <li>Vetor:begin()
        <ul>
          <li>Descricao: Metodo begin que seta o iterador para o primeira posicao do Vetor.</li>
        </ul>
      </li>
      <li>Vetor:finale()
        <ul>
          <li>Descricao: Metodo finale que seta o iterador para a ultima posicao do Vetor.</li>
        </ul>
      </li>
      <li>Vetor:setIt(index)
        <ul>
          <li>Metodo setIt que seta o iterador para uma posicao arbitraria do Vetor.</li>
          <li>Argumentos: (Int) Indice qual se deseja setar o iterador.</li>
        </ul>
      </li>
      <li>Vetor:after()
        <ul>
          <li>Descricao: Metodo after que busca o proximo elemento do vetor baseando-se no iterador.</li>
          <li>Retorno: (Object) Objeto da posicao iterada.</li>
        </ul>
      </li>
      <li>Vetor:before()
        <ul>
          <li>Descricao: Metodo before que busca o elemento anterior do vetor baseando-se no iterador.</li>
          <li>Retorno: (Object) Objeto da posicao iterada.</li>
        </ul>
      </li>
      <li>Vetor:swap(vetor_base)
        <ul>
          <li>Descricao: Metodo swap que troca todo conteudo do Vetor pelo conteudo de outro Vetor.</li>
          <li>Argumentos: (Vetor) Vetor base para o swap</li>
          <li>Retorno: (Int) Numero de posicoes copiadas</li>
        </ul>
      </li>
      <li>Vetor:free()
        <ul>
          <li>Descricao: Metodo para liberar o Vetor.</li>
        </ul>
      </li>
    </ul> 
    <p>...</p>
  </div>
</div>
<h5>Exemplo</h5>

```lua

local Vetor = require("vetor");
local aux = Vetor:new();
aux:insert("test");
aux:insert(17);
aux:insert(true);
print(aux:at(1));


```
<hr>


Este projeto está em desenvolvimento...
