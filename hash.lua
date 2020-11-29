--Definicao padrao dos atributos da Tabela Hash
TabelaHash = {tabela = {}, m = 0, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto TabelaHash.
--args: (Table) Atributos desejados para a TabelaHash.
--args: (int) m = tamanho estático da tabela hash.
--return: (Object) TabelaHash instanciada.
function TabelaHash:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    self.m = 1000000;
    self._indexlast = self._indexfirst + self.m - 1;
    for i=1, self.m do
        self.tabela[i] = nil;
    end
    return atributos;
end





return Lista;