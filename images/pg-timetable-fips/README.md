# pg-timetable-fips

An advanced standalone job scheduler for PostgreSQL, offering many advantages over traditional schedulers such as cron and others. This image provides FIPS support for pg-timetable

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pg-timetable-fips

# Load into Docker
nix build .#load-pg-timetable-fips-to-docker && ./result/bin/load-pg-timetable-fips-to-docker
```
