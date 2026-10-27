-- Arc · esquema de Supabase
-- Ejecuta este archivo entero en Supabase → SQL Editor → New query → Run.
-- No toca las tablas del Cuaderno (logs, settings, body): Arc solo las lee.

create table if not exists public.arc_items (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  kind       text not null,                 -- habit, log, goal, task, mood, review, meta
  id         text not null,
  body       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, kind, id)
);

alter table public.arc_items enable row level security;
drop policy if exists "arc propio" on public.arc_items;
create policy "arc propio" on public.arc_items for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Sincronización en vivo entre ordenador y móvil
do $$
begin
  begin alter publication supabase_realtime add table public.arc_items; exception when duplicate_object then null; end;
end $$;
