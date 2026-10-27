# Arc

App personal de objetivos grandes y hábitos que sustituye al Winter Arc. Va por capítulos (Winter Arc → Maratón → Grado → Verano → 70.3) y siempre enseña arriba el **norte**: el objetivo grande más cercano con su cuenta atrás.

- **Web:** GitHub Pages (archivos estáticos, sin compilación).
- **Datos:** el mismo proyecto de Supabase que el Cuaderno Barcelona 2027, con la misma cuenta. Arc guarda lo suyo en la tabla `arc_items` y **solo lee** `logs` y `settings` del Cuaderno para marcar el hábito Entreno.

## Puesta en marcha

1. **Supabase → SQL Editor:** pega `schema.sql` y pulsa *Run*. Crea solo la tabla `arc_items`; no toca las del Cuaderno.
2. **GitHub → Settings → Pages:** *Deploy from a branch*, rama `main`, carpeta `/ (root)`.
3. Abre `https://jaumesalom10.github.io/arc/` y entra con la misma cuenta del Cuaderno.
4. En el primer arranque, pega los datos del Winter Arc (`/api/records`) para traerte marcas, check-ins, tareas y extras, o empieza sin importar.

Para probar sin Supabase: abre `index.html?local` (los datos se quedan en ese navegador).

## Reglas

- **Núcleo y extras:** solo el núcleo cuenta para ganar la semana; los extras suman en estadísticas pero no restan.
- **Ideal y mínimo:** la semana se gana si todos los hábitos del núcleo llegan a su mínimo.
- **Comodín:** si a un solo hábito le falta una vez para el mínimo, la semana sigue ganada.
- **Rachas:** semanas seguidas cumpliendo el mínimo. La semana en curso no rompe la racha.
- **Entreno:** se marca solo con las sesiones hechas o adaptadas del Cuaderno.

## Archivos

| Archivo | Qué es |
|---|---|
| `index.html` | La app completa |
| `config.js` | URL y clave pública de Supabase, y enlace al Cuaderno |
| `schema.sql` | Tabla `arc_items`, reglas RLS y tiempo real |
| `vendor/` | Cliente de Supabase (supabase-js 2.45.4) |
| `manifest.webmanifest`, `icons/` | Instalación como app en el móvil |
