# Catálogo de Fotógrafo

Aplicação web desenvolvida para apresentar serviços fotográficos, organizar um catálogo de planos e preços e facilitar o gerenciamento do conteúdo por meio de um painel administrativo.

O projeto utiliza **Astro** para a construção da interface, **Supabase** para serviços de backend e **Cloudflare Pages** como plataforma de hospedagem, buscando uma solução leve, moderna e de fácil manutenção.

## Demonstração online

Acesse a versão publicada do projeto:

**[Catálogo de Fotógrafo — Acessar o site](https://catalogo-fotografo-vitor.fotografo123.workers.dev/)**



## Funcionalidades

### Site público

- **Página inicial:** apresentação do fotógrafo e exibição de fotografias selecionadas.
- **Catálogo de serviços:** apresentação dos planos e respectivos preços.
- **Componentização:** cabeçalho, rodapé e cartões de planos reutilizáveis.
- **Layout responsivo:** interface adaptável a diferentes tamanhos de tela.
- **Conteúdo dinâmico:** integração com o Supabase para disponibilizar informações cadastradas.

### Painel administrativo

O projeto possui uma área administrativa dedicada ao gerenciamento do conteúdo do site.

- **Autenticação administrativa:** acesso restrito ao painel.
- **Gerenciamento da página inicial:** administração do conteúdo e das fotografias em destaque.
- **Gerenciamento de fotografias:** integração com o Supabase Storage para armazenamento de imagens.
- **Gerenciamento de planos:** área administrativa para manutenção dos planos e preços.
- **Integração com banco de dados:** utilização do Supabase para persistência das informações.

##  Tecnologias

| Tecnologia | Aplicação no projeto |
|---|---|
| Astro | Construção das páginas e geração de conteúdo estático |
| TypeScript | Tipagem e organização do código de integração |
| HTML5 | Estrutura das páginas |
| CSS3 | Estilização e responsividade |
| JavaScript | Interatividade e integração com serviços |
| Supabase | Banco de dados, autenticação e armazenamento de imagens |
| Cloudflare Pages | Hospedagem da aplicação |
| Wrangler | Ferramentas de desenvolvimento e integração com o ambiente Cloudflare |

##  Arquitetura do projeto

O projeto separa a interface em componentes reutilizáveis, organiza as páginas por funcionalidade e centraliza a integração com o Supabase em um módulo próprio.

```text
catalogo-fotografo/
├── migrations/                 # Migrações do banco de dados
├── public/                     # Arquivos públicos e favicons
├── src/
│   ├── components/
│   │   ├── Footer.astro        # Rodapé
│   │   ├── Header.astro        # Cabeçalho
│   │   └── PlanoCard.astro     # Cartão de plano
│   ├── layouts/
│   │   └── Layout.astro        # Layout compartilhado
│   ├── lib/
│   │   └── supabase.ts         # Integração com Supabase
│   ├── pages/
│   │   ├── admin/
│   │   │   ├── fotografias.astro
│   │   │   ├── home.astro
│   │   │   ├── index.astro
│   │   │   ├── painel.astro
│   │   │   └── planos.astro
│   │   ├── catalogo.astro      # Catálogo público
│   │   └── index.astro         # Página inicial
│   └── styles/
│       └── global.css          # Estilos globais
├── .gitignore
├── astro.config.mjs
├── package.json
├── package-lock.json
├── tsconfig.json
└── README.md
```

Os diretórios `.astro`, `.wrangler`, `dist` e `node_modules` são omitidos da árvore principal por serem utilizados no desenvolvimento, na geração de arquivos ou no gerenciamento de dependências, conforme sua configuração.

##  Como executar localmente

### Pré-requisitos

- Node.js compatível com a versão do Astro utilizada.
- npm.
- Conta e projeto configurados no Supabase.

### 1. Clone o repositório

```bash
git clone https://github.com/VitorFoppa/catalogo-fotografo.git
cd catalogo-fotografo
```

### 2. Instale as dependências

```bash
npm install
```

### 3. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto e configure as variáveis exigidas pela implementação em `src/lib/supabase.ts`.

Exemplo ilustrativo:

```env
PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
PUBLIC_SUPABASE_ANON_KEY=sua-chave-publica
```

Os nomes acima são exemplos. Confira `src/lib/supabase.ts` para utilizar os nomes exatos esperados pelo código.

**Segurança:** não publique o arquivo `.env`, senhas ou chaves administrativas. Variáveis com prefixo `PUBLIC_` podem ser disponibilizadas no cliente; utilize nelas somente valores destinados à exposição pública, com as políticas de acesso devidamente configuradas no Supabase.

### 4. Execute o ambiente de desenvolvimento

```bash
npm run dev
```

O Astro normalmente disponibiliza a aplicação em:

```text
http://localhost:4321
```

### 5. Gere a versão de produção

```bash
npm run build
```

Os arquivos gerados são disponibilizados no diretório `dist/`.

Para executar a pré-visualização local da versão compilada:

```bash
npm run preview
```

## Publicação no Cloudflare Pages

O projeto utiliza geração estática do Astro, configurada em `astro.config.mjs`.

Configuração básica de build:

| Configuração | Valor |
|---|---|
| Framework | Astro |
| Comando de build | `npm run build` |
| Diretório de saída | `dist` |
| Repositório | GitHub |
| Hospedagem | Cloudflare Pages |

### Etapas de publicação

1. Envie o código para o GitHub.
2. Conecte o repositório ao Cloudflare Pages.
3. Configure o comando de build e o diretório de saída.
4. Cadastre as variáveis de ambiente necessárias no ambiente de implantação.
5. Verifique a comunicação com o Supabase.
6. Execute o deploy e teste as páginas públicas e administrativas.

Como o projeto utiliza serviços externos, a geração estática das páginas não elimina a necessidade de configurar corretamente a autenticação, as permissões e as requisições ao Supabase.

## Segurança e boas práticas

- Separação entre páginas públicas e área administrativa.
- Configuração de autenticação para operações administrativas.
- Proteção das credenciais por meio de variáveis de ambiente.
- Configuração de políticas de acesso no banco de dados e no armazenamento de imagens.
- Uso do `.gitignore` para evitar o versionamento de arquivos locais e dados sensíveis.
- Organização do código em componentes, layouts e módulos de integração.

## Objetivos de desenvolvimento

Este projeto foi desenvolvido para aplicar conhecimentos de desenvolvimento web na construção de uma aplicação real, incluindo:

- Desenvolvimento de interfaces com Astro.
- Organização de páginas e componentes reutilizáveis.
- Integração com serviços externos por meio de APIs.
- Utilização de banco de dados e armazenamento em nuvem.
- Implementação de funcionalidades administrativas.
- Configuração de build e publicação de aplicações web.
- Cuidados com configuração e segurança de aplicações.

##  Autor

**Vitor Foppa**

- GitHub: [@VitorFoppa](https://github.com/VitorFoppa)
- Repositório: [catalogo-fotografo](https://github.com/VitorFoppa/catalogo-fotografo)

---

Desenvolvido com Astro, TypeScript, Supabase e Cloudflare Pages.
