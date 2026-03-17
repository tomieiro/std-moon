<h1>Standard Library for Lua</h1>
Biblioteca para Linguagem Lua que implementa estruturas de dados mais utilizadas e algoritmos principais.

<p>
  <img src="https://www.andreas-rozek.de/Lua/Lua-Logo_32x32.png" alt="lua_logo"/ align=center>  Lua: https://www.lua.org/
</p>

Library to Lua Programming Language that aims to provide most used data structures and algorithms.

<hr>
<h3>Motivacao</h3>
<p>Criar um repositorio independente e aberto com diversas estruturas de dados implementadas em Lua. A ideia do projeto consiste em expandir o repertorio da biblioteca atraves de contribuicoes externas.</p>
<p>Os contribuidores do repositorio podem ser consultados no arquivo CONTRIBUTORS.</p>

<hr>
<h3>Contribuicao</h3>
<p>Qualquer um pode contribuir, basta abrir uma issue, realizar um fork e fazer um pull request. Ler CONTRUBUTING.md para todos os detalhes desse processo.</p>

<hr>
<h3>Utilizacao</h3>
<p>A utilização das estruturas é bem simples. Basta baixar o arquivo ".lua" da estrutura desejada e juntar ao projeto. Após isso, importar e instanciar a classe da estrutura utilizando esse arquivo:</p>

```lua
local classe_estrutura = require("estrutura_desejado.lua");
local objeto = classe_estrutura:new()
```

<hr>
<h3>Documentacao - Estrutura de Dados</h3>
<h4>Arvore binaria</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura basica de arvore binaria de busca. Permite inserir, remover e imprimir elementos em ordem.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Arvore:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Arvore.</li>
          <li>Argumentos: (Table) Atributos desejados para a Arvore.</li>
          <li>Retorno: (Object) Arvore instanciada.</li>
        </ul>
      </li>
      <li><b>Arvore:insert(elem)</b>
        <ul>
          <li>Descricao: Metodo insert que adiciona um elemento na arvore binaria.</li>
          <li>Argumentos: (Object) Elemento desejado para incluir na arvore.</li>
        </ul>
      </li>
      <li><b>Arvore:remove(elem)</b>
        <ul>
          <li>Descricao: Metodo remove que exclui um elemento da arvore binaria.</li>
          <li>Argumentos: (Object) Elemento desejado para remover da arvore.</li>
        </ul>
      </li>
      <li><b>Arvore:print()</b>
        <ul>
          <li>Descricao: Metodo que imprime os elementos da arvore em ordem.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Arvore = require("arvore_binaria");
local arvore = Arvore:new();

arvore:insert(10);
arvore:insert(5);
arvore:insert(15);

arvore:remove(5);
arvore:print();
```
<hr>

<h4>AVL</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura balanceada de arvore binaria de busca. Mantem a altura controlada apos insercoes e remocoes internas.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Arvore:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Arvore AVL.</li>
          <li>Argumentos: (Table) Atributos desejados para a Arvore AVL.</li>
          <li>Retorno: (Object) Arvore AVL instanciada.</li>
        </ul>
      </li>
      <li><b>Arvore:add(new_value)</b>
        <ul>
          <li>Descricao: Metodo add que insere um novo valor na arvore AVL.</li>
          <li>Argumentos: (Object) Valor desejado para incluir na arvore.</li>
        </ul>
      </li>
      <li><b>Arvore:print()</b>
        <ul>
          <li>Descricao: Metodo que imprime os elementos e alturas da arvore AVL em ordem.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local AVL = require("avl");
local arvore = AVL:new();

arvore:add(3);
arvore:add(2);
arvore:add(1);

arvore:print();
```
<hr>

<h4>Fila de Prioridade (Heap)</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura basica de fila de prioridade. A ordenacao dos elementos e controlada por uma funcao de comparacao informada na criacao.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Fila_Prioridade:new(args, func)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Fila_Prioridade.</li>
          <li>Argumentos: (Table) Atributos desejados para a Fila_Prioridade.</li>
          <li>            (Function) Funcao de comparacao entre os elementos.</li>
          <li>Retorno: (Object) Fila_Prioridade instanciada.</li>
        </ul>
      </li>
      <li><b>Fila_Prioridade:push(objeto)</b>
        <ul>
          <li>Descricao: Metodo push que insere um objeto na fila de prioridade.</li>
          <li>Argumentos: (Object) Objeto desejado para incluir na fila.</li>
        </ul>
      </li>
      <li><b>Fila_Prioridade:pop()</b>
        <ul>
          <li>Descricao: Metodo pop que remove o objeto com maior prioridade.</li>
          <li>Retorno: (Object) Objeto removido da fila.</li>
        </ul>
      </li>
      <li><b>Fila_Prioridade:print()</b>
        <ul>
          <li>Descricao: Funcao que printa toda a fila.</li>
        </ul>
      </li>
      <li><b>Fila_Prioridade:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar a fila de prioridade.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Fila_Prioridade = require("fila_prioridade");
local fila = Fila_Prioridade:new({}, function(a, b)
  return a < b;
end);

fila:push(3);
fila:push(1);
fila:push(2);

print(fila:pop()); --> 1
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
      <li><b>Fila:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Fila.</li>
          <li>Argumentos: (Table) Atributos desejados para a Fila.</li>
          <li>Retorno: (Object) Fila instanciada.</li>
        </ul>
      </li>
      <li><b>Fila:push(args)</b>
        <ul>
          <li>Descricao: Metodo push que insere um objeto na Fila.</li>
          <li>Argumentos: (Object) Objeto desejados para incluir na Fila.</li>
        </ul>
      </li>
      <li><b>Fila:pop()</b>
        <ul>
          <li>Descricao: Metodo pop que remove um objeto da Fila.</li>
          <li>Retorno: (Object) Objeto removida da Fila.</li>
        </ul>
      </li>
      <li><b>Fila:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar a Fila.</li>
        </ul>
      </li>
    </ul>
    <p>Implementacao pronta para operacoes basicas de insercao, remocao, leitura e liberacao da estrutura.</p>
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
    <p>Estrutura basica de grafo orientado com pesos nas arestas. Cada no armazena valor e lista de adjacencia.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Grafo:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Grafo.</li>
          <li>Argumentos: (Table) Atributos desejados para o Grafo.</li>
          <li>Retorno: (Object) Grafo instanciado.</li>
        </ul>
      </li>
      <li><b>Grafo:addNo(index, valor)</b>
        <ul>
          <li>Descricao: Metodo que adiciona um novo no no grafo.</li>
          <li>Argumentos: (Object) Identificador do no.</li>
          <li>            (Object) Valor armazenado no no.</li>
        </ul>
      </li>
      <li><b>Grafo:removeNo(index)</b>
        <ul>
          <li>Descricao: Metodo que remove um no do grafo.</li>
          <li>Argumentos: (Object) Identificador do no.</li>
        </ul>
      </li>
      <li><b>Grafo:addEdge(src, dest, peso)</b>
        <ul>
          <li>Descricao: Metodo que adiciona uma aresta entre dois nos.</li>
          <li>Argumentos: (Object) No de origem.</li>
          <li>            (Object) No de destino.</li>
          <li>            (Number) Peso da aresta.</li>
        </ul>
      </li>
      <li><b>Grafo:removeEdge(src, dest)</b>
        <ul>
          <li>Descricao: Metodo que remove uma aresta entre dois nos.</li>
          <li>Argumentos: (Object) No de origem.</li>
          <li>            (Object) No de destino.</li>
        </ul>
      </li>
      <li><b>Grafo:printAdjacent(index)</b>
        <ul>
          <li>Descricao: Metodo que imprime a lista de adjacencia de um no.</li>
          <li>Argumentos: (Object) Identificador do no.</li>
        </ul>
      </li>
      <li><b>Grafo:print()</b>
        <ul>
          <li>Descricao: Metodo que imprime todos os nos e suas adjacencias.</li>
        </ul>
      </li>
      <li><b>Grafo:getValor(index)</b>
        <ul>
          <li>Descricao: Metodo que retorna o valor armazenado em um no.</li>
          <li>Argumentos: (Object) Identificador do no.</li>
          <li>Retorno: (Object) Valor armazenado no no.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Grafo = require("grafo");
local grafo = Grafo:new();

grafo:addNo(1, "A");
grafo:addNo(2, "B");
grafo:addEdge(1, 2, 5);

grafo:print();
```
<hr>

<h4>Hash</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Tabela hash simples para armazenamento de numeros inteiros, com insercao, remocao, busca interna e limpeza da estrutura.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>TabelaHash:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto TabelaHash.</li>
          <li>Argumentos: (Table) Atributos desejados para a TabelaHash.</li>
          <li>Retorno: (Object) TabelaHash instanciada.</li>
        </ul>
      </li>
      <li><b>TabelaHash:insert(key)</b>
        <ul>
          <li>Descricao: Metodo insert que adiciona uma chave na tabela hash.</li>
          <li>Argumentos: (Number) Chave desejada para incluir.</li>
        </ul>
      </li>
      <li><b>TabelaHash:remove(key)</b>
        <ul>
          <li>Descricao: Metodo remove que exclui uma chave da tabela hash.</li>
          <li>Argumentos: (Number) Chave desejada para remover.</li>
        </ul>
      </li>
      <li><b>TabelaHash:clear()</b>
        <ul>
          <li>Descricao: Funcao que remove todos os elementos da tabela hash.</li>
        </ul>
      </li>
      <li><b>TabelaHash:print()</b>
        <ul>
          <li>Descricao: Funcao que printa os elementos armazenados e suas posicoes.</li>
        </ul>
      </li>
      <li><b>TabelaHash:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar a tabela hash.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local TabelaHash = require("hash");
local hash = TabelaHash:new({m = 10});

hash:insert(10);
hash:insert(20);
hash:print();
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
        <li><b>Lua:new(atributos)</b>
          <ul>
            <li>Descricao: Metodo cosntrutor que instancia o objeto Lista..</li>
            <li>Argumentos: (Table) Atributos desejados para a Lista.</li>
            <li>Retorno: (Object) Lista instanciada.</li>
          </ul>
        </li>
        <li><b>Lista:append(objeto)</b>
          <ul>
            <li>Descricao: Metodo append que insere um objeto no fim da Lista.</li>
            <li>Argumentos: (Object) Objeto desejados para incluir na Lista.</li>
          </ul>
        </li>
        <li><b>Lista:insert(objeto, i)</b>
          <ul>
            <li>Descricao: Metodo append que insere um objeto em uma posição específica da Lista.</li>
            <li>Argumentos: (Object) Objeto desejados para incluir na Lista.</li>
            <li>            (Int) Índice da posição para inserir na lista.</li>
          </ul>
        </li>
        <li><b>Lista:pop(i)</b>
          <ul>
            <li>Descricao: Metodo pop que remove um objeto específico da Lista.</li>
            <li>Argumentos: (Int) Índice da posição para remover da lista.</li>
            <li>Retorno: (Object) Objeto removida da Lista.</li>
          </ul>
        </li>
        <li><b>Lista:print()</b>
          <ul>
            <li>Descricao: Funcao que printa toda a lista</li>
          </ul>
        </li>
        <li><b>Lista:count()</b>
          <ul>
            <li>Descricao: Funcao que retorna a quantidade de elementos na lista.</li>
            <li>Retorno: (Int) Quantidade de elementos da lista.</li>
          </ul>
        </li>
        <li><b>Lista:extend(lista_base)</b>
          <ul>
            <li>Descricao: Funcao que extende uma lista em outra. Concatena no fim. Ou seja, adiciona a lista_base no fim da lista.</li>
            <li>Argumentos: (Lista) Lista a ser adicionada.</li>
          </ul>
        </li>
        <li><b>Lista:clear()</b>
          <ul>
            <li>Descricao: Funcao que remove todos os elementos de uma Lista.</li>
          </ul>
        </li>
        <li><b>Lista:index(elemento)</b>
          <ul>
            <li>Descricao: Funcao que retorna o índice do primeiro elemento com o valor especificado.</li>
            <li>Argumentos: (Object) elemento a ser identificado na lista.</li>
            <li>Retorno: (Int) Índice correspondente. Quando não há um elemento, retorna -1;</li>
          </ul>
        </li>
        <li><b>Lista:remove(elemento)</b>
          <ul>
            <li>Descricao: Funcao que remove o primeiro elemento com o valor especificado.</li>
            <li>Retorno: (Object) elemento a ser identificado na lista.</li>
          </ul>
        </li>
        <li><b>Lista:copy()</b>
          <ul>
            <li>Descricao: Funcao que retorna a cópia de uma lista.</li>
            <li>Argumentos: (Object) elemento a ser identificado na lista.</li>
          </ul>
        </li>
        <li><b>Lista:reverse()</b>
          <ul>
            <li>Descricao: Funcao que reverte a ordem dos elementos de uma lista.</li>
          </ul>
        </li>
        <li><b>Lista:sort()</b>
          <ul>
            <li>Descricao: Funcao que ordena uma Lista.</li>
          </ul>
        </li>
        <li><b>Lista:free()</b>
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

<h4>Matriz</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura basica de matriz com acesso por linha, coluna e posicao, alem de suporte a troca de elementos.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Matriz:new(args, rows, cols)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Matriz.</li>
          <li>Argumentos: (Table) Atributos desejados para a Matriz.</li>
          <li>            (Int) Quantidade de linhas.</li>
          <li>            (Int) Quantidade de colunas.</li>
          <li>Retorno: (Object) Matriz instanciada.</li>
        </ul>
      </li>
      <li><b>Matriz:getLine(line)</b>
        <ul>
          <li>Descricao: Metodo que retorna uma linha da matriz.</li>
          <li>Argumentos: (Int) Linha desejada.</li>
          <li>Retorno: (Table) Linha requisitada.</li>
        </ul>
      </li>
      <li><b>Matriz:getCol(col)</b>
        <ul>
          <li>Descricao: Metodo que retorna uma coluna da matriz.</li>
          <li>Argumentos: (Int) Coluna desejada.</li>
          <li>Retorno: (Table) Coluna requisitada.</li>
        </ul>
      </li>
      <li><b>Matriz:swap(first_row, first_col, second_row, second_col)</b>
        <ul>
          <li>Descricao: Metodo que troca dois elementos da matriz.</li>
          <li>Argumentos: (Int) Linha do primeiro elemento.</li>
          <li>            (Int) Coluna do primeiro elemento.</li>
          <li>            (Int) Linha do segundo elemento.</li>
          <li>            (Int) Coluna do segundo elemento.</li>
        </ul>
      </li>
      <li><b>Matriz:getPos(row, col)</b>
        <ul>
          <li>Descricao: Metodo que retorna o elemento de uma posicao da matriz.</li>
          <li>Argumentos: (Int) Linha desejada.</li>
          <li>            (Int) Coluna desejada.</li>
          <li>Retorno: (Object) Elemento da posicao.</li>
        </ul>
      </li>
      <li><b>Matriz:setPos(item, row, col)</b>
        <ul>
          <li>Descricao: Metodo que atribui um elemento em uma posicao da matriz.</li>
          <li>Argumentos: (Object) Item desejado.</li>
          <li>            (Int) Linha desejada.</li>
          <li>            (Int) Coluna desejada.</li>
        </ul>
      </li>
      <li><b>Matriz:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar a Matriz.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Matriz = require("matriz");
local matriz = Matriz:new({}, 2, 2);

matriz:setPos(10, 1, 1);
matriz:setPos(20, 1, 2);

print(matriz:getPos(1, 2)); --> 20
```
<hr>

<h4>Pilha</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Estrutura básica de Pilha. Estrutura de dados que segue a logica LIFO(last in, first out).</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>Pilha:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Pilha.</li>
          <li>Argumentos: (Table) Atributos desejados para a Pilha.</li>
          <li>Retorno: (Object) Pilha instanciada.</li>
        </ul>
      </li>
      <li><b>Pilha:push(args)</b>
        <ul>
          <li>Descricao: Metodo push que insere um objeto na Pilha.</li>
          <li>Argumentos: (Object) Objeto desejados para incluir na Pilha.</li>
        </ul>
      </li>
      <li><b>Pilha:pop()</b>
        <ul>
          <li>Descricao: Metodo pop que remove um objeto da Pilha.</li>
          <li>Retorno: (Object) Objeto removido da Pilha.</li>
        </ul>
      </li>
      <li><b>Pilha:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar a Pilha.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Pilha = require("pilha");
local nova_pilha = Pilha:new();

nova_pilha:push("Primeiro_Elemento");
nova_pilha:push("Segundo_Elemento");

local elemento_extraido = nova_pilha:pop();
print(elemento_extraido);

nova_pilha:free();
nova_pilha = nil;
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
      <li><b>Vetor:new(args)</b>
        <ul>
          <li>Descricao: Metodo construtor que instancia o objeto Vetor.</li>
          <li>Argumentos: (Table) Atributos desejados para o Vetor.</li>
          <li>Retorno: (Object) Vetor instanciado.</li>
        </ul>
      </li>
      <li><b>Vetor:insert(objeto)</b>
        <ul>
          <li>Descricao: Metodo insert que insere um objeto no Vetor.</li>
          <li>Argumentos: (Object) Objeto desejados para incluir no Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:at(index)</b>
        <ul>
          <li>Descricao: Metodo at que acessa um objeto do Vetor.</li>
          <li>Argumentos: (Int) Indice qual se deseja acessar</li>
          <li>Retorno: (Object) Objeto acessado do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:tam()</b>
        <ul>
          <li>Descricao: Metodo que retorna o tamanho do Vetor.</li>
          <li>Retorno: (Int)Tamanho do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:front()</b>
        <ul>
          <li>Descricao: Metodo front que acessa o primeiro objeto do Vetor.</li>
          <li>Retorno: (Object) Objeto da primeira posicao do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:back()</b>
        <ul>
          <li>Descricao: Metodo back que acessao ultimo objeto do Vetor.</li>
          <li>Retorno: (Object) Objeto da ultima posicao do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:begin()</b>
        <ul>
          <li>Descricao: Metodo begin que seta o iterador para o primeira posicao do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:finale()</b>
        <ul>
          <li>Descricao: Metodo finale que seta o iterador para a ultima posicao do Vetor.</li>
        </ul>
      </li>
      <li><b>Vetor:setIt(index)</b>
        <ul>
          <li>Metodo setIt que seta o iterador para uma posicao arbitraria do Vetor.</li>
          <li>Argumentos: (Int) Indice qual se deseja setar o iterador.</li>
        </ul>
      </li>
      <li><b>Vetor:after()</b>
        <ul>
          <li>Descricao: Metodo after que busca o proximo elemento do vetor baseando-se no iterador.</li>
          <li>Retorno: (Object) Objeto da posicao iterada.</li>
        </ul>
      </li>
      <li><b>Vetor:before()</b>
        <ul>
          <li>Descricao: Metodo before que busca o elemento anterior do vetor baseando-se no iterador.</li>
          <li>Retorno: (Object) Objeto da posicao iterada.</li>
        </ul>
      </li>
      <li><b>Vetor:swap(vetor_base)</b>
        <ul>
          <li>Descricao: Metodo swap que troca todo conteudo do Vetor pelo conteudo de outro Vetor.</li>
          <li>Argumentos: (Vetor) Vetor base para o swap</li>
          <li>Retorno: (Int) Numero de posicoes copiadas</li>
        </ul>
      </li>
      <li><b>Vetor:free()</b>
        <ul>
          <li>Descricao: Metodo para liberar o Vetor.</li>
        </ul>
      </li>
    </ul>
    <p>Implementacao pronta para acesso por indice, iteracao simples e troca de conteudo da estrutura.</p>
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

<hr>
<h3>Documentacao - Algoritmos</h3>
<h4>Busca Binaria</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo de busca em vetor ordenado. Retorna a posicao do valor buscado ou -1 quando o valor nao existe.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>busca_binaria(array, valor)</b>
        <ul>
          <li>Descricao: Funcao que realiza busca binaria em um vetor ordenado.</li>
          <li>Argumentos: (Table) Vetor ordenado para consulta.</li>
          <li>            (Object) Valor desejado.</li>
          <li>Retorno: (Int) Posicao encontrada ou -1.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local busca_binaria = require("binarysearch");
local pos = busca_binaria({1, 3, 5, 7}, 5);
print(pos); --> 3
```
<hr>

<h4>Bubble Sort</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo de ordenacao simples baseado em trocas sucessivas entre elementos adjacentes.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>bubbleSort(arr)</b>
        <ul>
          <li>Descricao: Funcao que ordena um vetor em ordem crescente.</li>
          <li>Argumentos: (Table) Vetor desejado para ordenacao.</li>
          <li>Retorno: (Table) Vetor ordenado.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local bubbleSort = require("bubblesort");
local resultado = bubbleSort({5, 4, 3, 2, 1});
print(resultado[1]); --> 1
```
<hr>

<h4>Dijkstra</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo para caminho minimo em grafos ponderados sem pesos negativos, usando matriz de adjacencia.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>dijkstra(matriz, de, para)</b>
        <ul>
          <li>Descricao: Funcao que calcula a menor distancia entre dois vertices.</li>
          <li>Argumentos: (Table) Matriz de adjacencia.</li>
          <li>            (Int) Vertice de origem.</li>
          <li>            (Int) Vertice de destino.</li>
          <li>Retorno: (Number) Distancia encontrada.</li>
          <li>         (Table) Tabela de predecessores do caminho.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Dijkstra = require("dijkstra");
local matriz = {
  {0, 1, 4},
  {1, 0, 2},
  {4, 2, 0}
};

local distancia = Dijkstra.dijkstra(matriz, 1, 3);
print(distancia); --> 3
```
<hr>

<h4>Insertion Sort</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo de ordenacao por insercao que organiza os elementos no proprio vetor.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>insertionsort(tabela)</b>
        <ul>
          <li>Descricao: Funcao que ordena um vetor em ordem crescente.</li>
          <li>Argumentos: (Table) Vetor desejado para ordenacao.</li>
          <li>Retorno: (Table) Vetor ordenado.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local insertionsort = require("insertionsort");
local resultado = insertionsort({4, 2, 3, 1});
print(resultado[1]); --> 1
```
<hr>

<h4>Merge Sort</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo de ordenacao por intercalação que divide o vetor em partes menores e depois recombina os resultados.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>mergeSort(vetor)</b>
        <ul>
          <li>Descricao: Funcao que ordena um vetor por intercalação.</li>
          <li>Argumentos: (Table) Vetor desejado para ordenacao.</li>
          <li>Retorno: (Table) Vetor ordenado.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local MergeSort = require("mergesort");
local resultado = MergeSort.mergeSort({4, 1, 3, 2});
print(resultado[1]); --> 1
```
<hr>

<h4>Quick Sort</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo de ordenacao que escolhe um pivo e particiona o vetor em elementos menores e maiores.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>quicksort(tabela)</b>
        <ul>
          <li>Descricao: Funcao que ordena um vetor em ordem crescente.</li>
          <li>Argumentos: (Table) Vetor desejado para ordenacao.</li>
          <li>Retorno: (Table) Novo vetor ordenado.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local quicksort = require("quicksort");
local resultado = quicksort({4, 2, 3, 1});
print(resultado[1]); --> 1
```
<hr>

<h4>Tarjan</h4>
<div>
  <h5>Informacoes</h5>
  <div>
    <p>Algoritmo para identificacao de componentes fortemente conexas em grafos orientados.</p>
  </div>
  <h5>Metodos</h5>
  <div>
    <ul>
      <li><b>tarjan(grafo)</b>
        <ul>
          <li>Descricao: Funcao que calcula as componentes fortemente conexas de um grafo.</li>
          <li>Argumentos: (Table) Lista de adjacencia do grafo.</li>
          <li>Retorno: (Table) Lista de componentes encontradas.</li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<h5>Exemplo</h5>

```lua
local Tarjan = require("tarjan");
local componentes = Tarjan.tarjan({
  {2},
  {1, 3},
  {}
});

print(#componentes);
```

Este projeto está em desenvolvimento...
