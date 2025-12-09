{ pkgs, lib, ... }:

# TODO: Add tests for pg-timetable-fips image
{
  name = "pg-timetable-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pg-timetable-fips"
    exit 1
  '';
}
