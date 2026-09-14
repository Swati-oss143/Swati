# Swati Portal — Total Final Package

This package contains the Swati Print-Portal-style frontend, admin dashboard UI, multicolour theme, maintenance toggle demo, service manager demo, and consolidated Supabase schema.

## GitHub Pages
Upload the contents of `public/` to the repository root, then enable Settings → Pages → Deploy from branch → main → /root.

## Supabase
Run `supabase/schema.sql` in the Supabase SQL Editor. Configure Auth, private Storage buckets, RLS policies, and environment variables before production.

## Important
The included admin controls are a frontend foundation. Production authentication, server-side authorization, private document policies, real CRUD persistence, and complete CMS wiring must be connected to Supabase before handling real customer documents.
