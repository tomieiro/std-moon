local function busca_binaria(array, valor)
  local i = 1;
  local j = #array;

  while(i <= j) do
    -- Divisao do vetor
    local meio = math.floor((i + j) / 2); -- Caso a divisao nao seja inteira, usamos apenas a parte inteira do resultado
    local val = array[meio];

    -- Realiza a busca
    if(val < valor) then
      i = meio + 1;
    elseif(val > valor) then
      j = meio - 1;
    else
      -- Valor encontrado na posicao retornada
      return meio;
    end
  end

  -- Caso o numero buscado nao seja encontrado, ou o tamanho do vetor seja 0
  return -1;
end
