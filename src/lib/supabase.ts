
import { createClient } from "@supabase/supabase-js";

// Obtém as credenciais públicas definidas no arquivo .env.
const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
const supabasePublishableKey =
  import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

// Impede que a aplicação inicialize sem as credenciais necessárias.
if (!supabaseUrl || !supabasePublishableKey) {
  throw new Error(
    "Configure PUBLIC_SUPABASE_URL e PUBLIC_SUPABASE_PUBLISHABLE_KEY no arquivo .env."
  );
}

// Cria um cliente compartilhado para autenticação e consultas.
// A sessão é mantida pelo Supabase JS no navegador.
export const supabase = createClient(
  supabaseUrl,
  supabasePublishableKey,
  {
    auth: {
      persistSession: true,
      autoRefreshToken: true,
      detectSessionInUrl: true,
    },
  }
);
