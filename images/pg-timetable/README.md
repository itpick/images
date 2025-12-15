# pg-timetable

An advanced standalone job scheduler for PostgreSQL, offering many advantages over traditional schedulers such as cron and others

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pg-timetable

# Load into Docker
nix build .#load-pg-timetable-to-docker && ./result/bin/load-pg-timetable-to-docker
```
