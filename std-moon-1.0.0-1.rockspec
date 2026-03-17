rockspec_format = "3.0"

package = "std-moon"
version = "1.0.0-1"

source = {
   url = "git+https://github.com/tomieiro/std-moon.git",
   tag = "1.0.0"
}

description = {
   summary = "Data structures and algorithms for Lua",
   detailed = "A Lua library that provides common data structures and algorithms.",
   homepage = "https://github.com/tomieiro/std-moon",
   license = "MIT"
}

dependencies = {
   "lua >= 5.2, < 5.5"
}

build = {
   type = "builtin",
   modules = {
      ["algorithms.binarysearch"] = "algorithms/binarysearch.lua",
      ["algorithms.bubblesort"] = "algorithms/bubblesort.lua",
      ["algorithms.dijkstra"] = "algorithms/dijkstra.lua",
      ["algorithms.insertionsort"] = "algorithms/insertionsort.lua",
      ["algorithms.mergesort"] = "algorithms/mergesort.lua",
      ["algorithms.quicksort"] = "algorithms/quicksort.lua",
      ["algorithms.tarjan"] = "algorithms/tarjan.lua",
      ["data_structures.arvore_binaria"] = "data_structures/arvore_binaria.lua",
      ["data_structures.avl"] = "data_structures/avl.lua",
      ["data_structures.fila"] = "data_structures/fila.lua",
      ["data_structures.fila_prioridade"] = "data_structures/fila_prioridade.lua",
      ["data_structures.grafo"] = "data_structures/grafo.lua",
      ["data_structures.hash"] = "data_structures/hash.lua",
      ["data_structures.lista"] = "data_structures/lista.lua",
      ["data_structures.matriz"] = "data_structures/matriz.lua",
      ["data_structures.pilha"] = "data_structures/pilha.lua",
      ["data_structures.vetor"] = "data_structures/vetor.lua"
   }
}

test = {
   type = "command",
   command = "lua testing/run.lua"
}
