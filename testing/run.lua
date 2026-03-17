package.path = "./?.lua;" .. package.path

local algorithm_tests = {
    "testing/algorithms/binarysearch.lua",
    "testing/algorithms/bubblesort.lua",
    "testing/algorithms/djikstra.lua",
    "testing/algorithms/insertionsort.lua",
    "testing/algorithms/mergesort.lua",
    "testing/algorithms/quicksort.lua",
    "testing/algorithms/tarjan.lua"
}

local data_structure_tests = {
    "testing/data_structures/arvore_binaria.lua",
    "testing/data_structures/avl.lua",
    "testing/data_structures/fila.lua",
    "testing/data_structures/fila_prioridade.lua",
    "testing/data_structures/grafo.lua",
    "testing/data_structures/hash.lua",
    "testing/data_structures/lista.lua",
    "testing/data_structures/matriz.lua",
    "testing/data_structures/pilha.lua",
    "testing/data_structures/vetor.lua"
}

local function run_tests(tests)
    for _, test_file in ipairs(tests) do
        dofile(test_file)
    end
end

local mode = arg[1]

if mode == nil then
    run_tests(algorithm_tests)
    run_tests(data_structure_tests)
elseif mode == "alg" then
    run_tests(algorithm_tests)
elseif mode == "ds" then
    run_tests(data_structure_tests)
else
    error("Use os argumentos 'alg' ou 'ds'.")
end
