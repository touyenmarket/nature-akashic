-- ============================================================
-- Nature Akashic — Schéma Supabase (Postgres)
-- Version : accès simple sans compte (à sécuriser plus tard)
-- ============================================================

create table if not exists remedes (
  id            bigint generated always as identity primary key,
  categorie     text not null,
  maladie       text not null,
  type          text,
  symptomes     text,
  zone          text,
  gravite       text,
  symptomes_cles text,
  complement   text,
  ou           text,
  contre       text,
  drapeaux     text,
  recours      text,
  reference    text default '',
  layout        text,
  angle         text,
  metaphore     text,
  infographie_url text,
  fiche_html    text,
  created_at    timestamptz default now(),
  updated_at    timestamptz default now(),
  unique (maladie)
);

create index if not exists idx_remedes_categorie on remedes (categorie);
create index if not exists idx_remedes_gravite on remedes (gravite);
create index if not exists idx_remedes_search on remedes using gin (
  to_tsvector('french', coalesce(maladie,'') || ' ' || coalesce(symptomes_cles,'') || ' ' || coalesce(complement,''))
);

create or replace function set_updated_at() returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists trg_remedes_updated_at on remedes;
create trigger trg_remedes_updated_at
  before update on remedes
  for each row execute function set_updated_at();

-- RLS activé mais politique ouverte pour l'instant (lecture + écriture publiques)
alter table remedes enable row level security;

create policy "Accès public complet (temporaire)" on remedes
  for all using (true) with check (true);
