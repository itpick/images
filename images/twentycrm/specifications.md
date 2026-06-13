# Specifications: twentycrm

- **Base:** upstream `twentycrm/twenty:v2.12.0` (re-wrapped)
- **Entrypoint:** inherited from upstream
- **Ports:** 3000 (default, app)
- **Persistent dirs:** none required for app server (state in Postgres)
- **Required env:** `APP_SECRET`, `PG_DATABASE_URL` (see upstream README)
