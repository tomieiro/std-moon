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
nova_fila = nil;

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
    <p>Estrutura basica de Lista. Seguem métodos tradicionais.</p>
  </div>
  <h5>Métodos</h5>
  <div>
    <p>
      <ul>
        <li>Lua:new(atributos)
          <ul>
            <li>Descricao: Metodo cosntrutor que instancia o objeto Lista..</li>
            <li>Argumentos: (Table) Atributos desejados para a Lista.</li>
            <li>Retorno: (Object) Lista instanciada.</li>
          </ul>
        </li>
        <li>Lista:append(objeto)
          <ul>
            <li>Descricao: Metodo append que insere um objeto no fim da Lista.</li>
            <li>Argumentos: (Object) Objeto desejados para incluir na Lista.</li>
          </ul>
        </li>
        <li>Lista:insert(objeto, i)
          <ul>
            <li>Descricao: Metodo append que insere um objeto em uma posição específica da Lista.</li>
            <li>Argumentos: (Object) Objeto desejados para incluir na Lista.</li>
            <li>            (Int) Índice da posição para inserir na lista.</li>
          </ul>
        </li>
        <li>Lista:pop(i)
          <ul>
            <li>Descricao: Metodo pop que remove um objeto específico da Lista.</li>
            <li>Argumentos: (Int) Índice da posição para remover da lista.</li>
            <li>Retorno: (Object) Objeto removida da Lista.</li>
          </ul>
        </li>
        <li>Lista:print()
          <ul>
            <li>Descricao: Funcao que printa toda a lista</li>
          </ul>
        </li>
        <li>Lista:count()
          <ul>
            <li>Descricao: Funcao que retorna a quantidade de elementos na lista.</li>
            <li>Retorno: (Int) Quantidade de elementos da lista.</li>
          </ul>
        </li>
        <li>Lista:extend(lista_base)
          <ul>
            <li>Descricao: Funcao que extende uma lista em outra. Concatena no fim. Ou seja, adiciona a lista_base no fim da lista.</li>
            <li>Argumentos: (Lista) Lista a ser adicionada.</li>
          </ul>
        </li>
        <li>Lista:clear()
          <ul>
            <li>Descricao: Funcao que remove todos os elementos de uma Lista.</li>
          </ul>
        </li>
        <li>Lista:index(elemento)
          <ul>
            <li>Descricao: Funcao que retorna o índice do primeiro elemento com o valor especificado.</li>
            <li>Argumentos: (Object) elemento a ser identificado na lista.</li>
            <li>Retorno: (Int) Índice correspondente. Quando não há um elemento, retorna -1;</li>
          </ul>
        </li>
        <li>Lista:remove(elemento)
          <ul>
            <li>Descricao: Funcao que remove o primeiro elemento com o valor especificado.</li>
            <li>Retorno: (Object) elemento a ser identificado na lista.</li>
          </ul>
        </li>
        <li>Lista:copy()
          <ul>
            <li>Descricao: Funcao que retorna a cópia de uma lista.</li>
            <li>Argumentos: (Object) elemento a ser identificado na lista.</li>
          </ul>
        </li>
        <li>Lista:reverse()
          <ul>
            <li>Descricao: Funcao que reverte a ordem dos elementos de uma lista.</li>
          </ul>
        </li>
        <li>Lista:sort()
          <ul>
            <li>Descricao: Funcao que ordena uma Lista.</li>
          </ul>
        </li>
        <li>Lista:free()
          <ul>
            <li>Descricao: Metodo para liberar a Lista.</li>
          </ul>
        </li>
      </ul>
    </p>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Lista = require("lista");
local aux = Lista:new();

aux:append("test");
aux:append(17);
aux:append(true);
aux:append("fim");

--Para printar a lista:
aux:print();

aux:free();
aux = nil;
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
    <p>Estrutura basica de Vetor. Segue metodos tradicionais.</p>
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
      <li>Vetor:tam()
        <ul>
          <li>Descricao: Metodo que retorna o tamanho do Vetor.</li>
          <li>Retorno: (Int)Tamanho do Vetor.</li>
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
aux:insert("fim");

print("Item na posicao 1 do vetor: " .. aux:at(1)); --> Item na posicao 1 do vetor: test
print("Inicio do vetor: " .. aux:front()); --> Inicio do vetor: test
print("Final do vetor: " .. aux:back()) --> Final do vetor: fim

--Para printar a lista:
aux:begin()
for i=1, aux:tam() do
  print(aux:after()) -->test 17 true fim
end

aux:swap({1, "trocado", 124, false});

--Para printar a lista:
aux:finale()
for i=1, aux:tam() do
  print(aux:before()) -->false 124 trocado 1
end

aux:free();
aux = nil;

```
<hr>


Este projeto está em desenvolvimento...
