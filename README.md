# Nature Akashic (by 2yen)

Plateforme web de 197 remèdes naturopathiques, connectée à Supabase.

## Structure
- `index.html` — l'application (recherche, filtres, ajout/édition/suppression)
- `sql/schema.sql` — schéma de la base Supabase
- `remedes_import.csv` — données d'import initial (197 remèdes)

## Stack
- Frontend : HTML/CSS/JS vanilla + supabase-js (CDN)
- Base de données : Supabase (Postgres)
- Hébergement : Vercel (déploiement automatique à chaque push)

## Déploiement
Ce repo est connecté à Vercel : tout push sur `main` redéploie automatiquement.
