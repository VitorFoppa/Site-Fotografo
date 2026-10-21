
import { defineConfig } from "astro/config";

// Configura o Astro para gerar páginas estáticas.
// O Cloudflare Pages publicará os arquivos gerados em dist/.
export default defineConfig({
  output: "static"
});
