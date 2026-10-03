-- ============================================================
-- BANCO DE DADOS DO CATÁLOGO DO FOTÓGRAFO
-- Migration inicial
-- ============================================================


-- ============================================================
-- CONFIGURAÇÕES
-- Guarda as informações gerais do fotógrafo.
--
-- Como teremos apenas um fotógrafo neste projeto,
-- utilizaremos uma única linha nesta tabela.
-- ============================================================

CREATE TABLE configuracoes (
    id INTEGER PRIMARY KEY,

    -- Nome que aparecerá no site.
    nome TEXT NOT NULL,

    -- Pequeno texto apresentado junto ao nome.
    subtitulo TEXT,

    -- Descrição/apresentação do fotógrafo.
    descricao TEXT,

    -- Link para o Instagram.
    instagram TEXT,

    -- Número/link do WhatsApp.
    whatsapp TEXT,

    -- Chave da foto principal armazenada posteriormente no R2.
    foto_principal TEXT,

    -- Chave da foto de perfil armazenada posteriormente no R2.
    foto_perfil TEXT
);


-- ============================================================
-- PLANOS
-- Guarda os planos oferecidos pelo fotógrafo.
--
-- Exemplo:
-- Ensaio
-- Casamento
-- Formatura
-- ============================================================

CREATE TABLE planos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    -- Nome do plano.
    nome TEXT NOT NULL,

    -- Descrição apresentada no cartão.
    descricao TEXT NOT NULL,

    -- Preço do plano.
    --
    -- Usamos REAL porque inicialmente queremos armazenar
    -- o valor numérico do preço.
    preco REAL NOT NULL,

    -- Define se o plano deve receber destaque visual.
    --
    -- 0 = não
    -- 1 = sim
    destaque INTEGER NOT NULL DEFAULT 0,

    -- Define se o plano está disponível no catálogo.
    --
    -- 0 = oculto
    -- 1 = ativo
    ativo INTEGER NOT NULL DEFAULT 1,

    -- Define a ordem dos planos no catálogo.
    ordem INTEGER NOT NULL DEFAULT 0,

    -- Futuramente poderá guardar a chave da imagem
    -- correspondente ao plano no R2.
    foto_key TEXT
);


-- ============================================================
-- ITENS DOS PLANOS
-- Cada plano pode possuir vários itens.
--
-- Exemplo:
--
-- Plano Ensaio
--   -> 1 hora de sessão
--   -> 20 fotos editadas
--   -> Entrega digital
-- ============================================================

CREATE TABLE plano_itens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    -- Plano ao qual este item pertence.
    plano_id INTEGER NOT NULL,

    -- Texto apresentado na lista do plano.
    descricao TEXT NOT NULL,

    -- Ordem em que o item aparecerá.
    ordem INTEGER NOT NULL DEFAULT 0,

    -- Impede que um item fique ligado a um plano
    -- que não existe.
    FOREIGN KEY (plano_id)
        REFERENCES planos(id)
        ON DELETE CASCADE
);


-- ============================================================
-- FOTOS
-- Guarda os dados das fotos.
--
-- IMPORTANTE:
-- A imagem propriamente dita NÃO ficará dentro do D1.
--
-- D1 guarda os metadados.
-- R2 armazenará o arquivo da imagem.
-- ============================================================

CREATE TABLE fotos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    -- Nome/título da foto.
    titulo TEXT NOT NULL,

    -- Descrição opcional.
    descricao TEXT,

    -- Categoria da foto.
    --
    -- Exemplos:
    -- casamento
    -- ensaio
    -- formatura
    -- portfolio
    categoria TEXT,

    -- Chave utilizada para encontrar a imagem no R2.
    storage_key TEXT NOT NULL,

    -- Define a ordem da foto na galeria.
    ordem INTEGER NOT NULL DEFAULT 0,

    -- Define se a foto aparece no site.
    --
    -- 0 = ocultar
    -- 1 = mostrar
    ativo INTEGER NOT NULL DEFAULT 1
);


-- ============================================================
-- ÍNDICES
-- Melhoram as consultas que faremos posteriormente.
-- ============================================================

-- Facilita buscar somente planos ativos.
CREATE INDEX idx_planos_ativo
ON planos(ativo);


-- Facilita ordenar os planos.
CREATE INDEX idx_planos_ordem
ON planos(ordem);


-- Facilita buscar fotos por categoria.
CREATE INDEX idx_fotos_categoria
ON fotos(categoria);


-- Facilita buscar somente fotos ativas.
CREATE INDEX idx_fotos_ativo
ON fotos(ativo);


-- Facilita ordenar as fotos.
CREATE INDEX idx_fotos_ordem
ON fotos(ordem);