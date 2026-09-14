-- Swati Portal Supabase foundation
create extension if not exists pgcrypto;
create table if not exists public.services(
 id uuid primary key default gen_random_uuid(),
 name text not null,
 description text default '',
 category text default 'General',
 active boolean not null default true,
 created_at timestamptz not null default now()
);
create table if not exists public.applications(
 id uuid primary key default gen_random_uuid(),
 application_no text unique not null,
 user_id uuid references auth.users(id) on delete set null,
 applicant_name text not null,
 mobile text not null,
 service_id uuid references public.services(id) on delete set null,
 notes text default '',
 status text not null default 'Received',
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create table if not exists public.profiles(
 id uuid primary key references auth.users(id) on delete cascade,
 full_name text,
 role text not null default 'customer' check(role in ('customer','admin','manager','operator','support')),
 created_at timestamptz not null default now()
);
alter table public.services enable row level security;
alter table public.applications enable row level security;
alter table public.profiles enable row level security;
create policy if not exists "public can read active services" on public.services for select using (active=true);
create policy if not exists "users read own applications" on public.applications for select using (auth.uid()=user_id);
create policy if not exists "users create own applications" on public.applications for insert with check (auth.uid()=user_id);
create policy if not exists "users read own profile" on public.profiles for select using (auth.uid()=id);
