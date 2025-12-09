{ pkgs, lib, ... }:

# TODO: Add tests for pg-timetable image
{
  name = "pg-timetable";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pg-timetable"
    exit 1
  '';
}
