{ lib
, stdenvNoCC
, fetchurl
, makeWrapper
, jre
, unzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "apache-nifi";
  version = "2.10.0";

  src = fetchurl {
    urls = [
      "https://archive.apache.org/dist/nifi/${version}/nifi-${version}-bin.zip"
      "https://downloads.apache.org/nifi/${version}/nifi-${version}-bin.zip"
    ];
    # SHA512 hash from https://downloads.apache.org/nifi/${version}/nifi-${version}-bin.zip.sha512
    hash = "sha512-pWyTytZ5S+zuqi45ii7pchFgrN0W5HkFDFeHmmYQJBEzYMXVd4vMN5x25khYBYaeJM21NLz4yzDGlW0JN3Fp1w==";
  };

  nativeBuildInputs = [ makeWrapper unzip ];

  dontBuild = true;
  dontConfigure = true;

  unpackPhase = ''
    runHook preUnpack
    unzip -q $src
    cd nifi-${version}
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt/nifi
    cp -r . $out/opt/nifi/

    # Create wrapper scripts that use the correct Java
    mkdir -p $out/bin

    # Create nifi wrapper
    makeWrapper $out/opt/nifi/bin/nifi.sh $out/bin/nifi \
      --set JAVA_HOME "${jre}" \
      --set NIFI_HOME "$out/opt/nifi" \
      --prefix PATH : "${jre}/bin"

    runHook postInstall
  '';

  passthru.updateScript = ./update.sh;

  meta = with lib; {
    description = "Apache NiFi - an easy to use, powerful, and reliable system to process and distribute data";
    homepage = "https://nifi.apache.org/";
    license = licenses.asl20;
    platforms = platforms.linux;
    sourceProvenance = [ sourceTypes.binaryBytecode ];
    maintainers = [];
  };
}
