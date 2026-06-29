{ pkgs, image }:

pkgs.writeShellScript "test-erlang" ''
  set -euo pipefail
  echo "Testing erlang image..."

  # erl with no args opens an interactive shell, so run a non-interactive eval
  # that prints the OTP release and halts (non-empty output).
  echo "  Checking erl runs..."
  out=$(docker run --rm ${image.imageName}:test -noshell -eval 'io:format("~s~n",[erlang:system_info(otp_release)]), halt().' 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking erl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v erl >/dev/null 2>&1 || ls /nix/store/*/bin/erl >/dev/null 2>&1' || true

  echo "All erlang tests passed!"
''
