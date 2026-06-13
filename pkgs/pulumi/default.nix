{ lib, stdenv, fetchurl }:

# https://github.com/pulumi/pulumi
# Override nixpkgs pulumi: bump to 3.246.0 ahead of nixpkgs 3.192.0.
# Uses the upstream statically-linked prebuilt binary tarball.

let
  version = "3.246.0";
  srcs = {
    x86_64-linux = fetchurl {
      url = "https://github.com/pulumi/pulumi/releases/download/v${version}/pulumi-v${version}-linux-x64.tar.gz";
      hash = "sha256-JJp5dVhxjKpi9p5yWbpqivDW2jviyuwx2soXz7u2wE8=";
    };
    aarch64-linux = fetchurl {
      url = "https://github.com/pulumi/pulumi/releases/download/v${version}/pulumi-v${version}-linux-arm64.tar.gz";
      hash = "sha256-rbKIZ4iKyDWpPdcYHFWXAvlu1s+szVxLb/+dv9x6M0w=";
    };
  };
in stdenv.mkDerivation {
  pname = "pulumi";
  inherit version;

  src = srcs.${stdenv.hostPlatform.system};

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp pulumi $out/bin/pulumi
    chmod +x $out/bin/pulumi
    runHook postInstall
  '';

  meta = with lib; {
    description = "Modern infrastructure as code";
    homepage = "https://www.pulumi.com";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
    mainProgram = "pulumi";
  };
}
