{ lib
, stdenvNoCC
, fetchurl
, makeWrapper
, jre
, unzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "apache-nifi";
  version = "2.6.0";

  src = fetchurl {
    urls = [
      "https://archive.apache.org/dist/nifi/${version}/nifi-${version}-bin.zip"
      "https://downloads.apache.org/nifi/${version}/nifi-${version}-bin.zip"
    ];
    # SHA512 hash from https://downloads.apache.org/nifi/${version}/nifi-${version}-bin.zip.sha512
    hash = "sha512-y3HU6b9434SBv3n971np7jfqKqIv5Eaeadp2Dp7R3/M0QZF583eIc+Op8dIp1m53eVTYC03B5ZhI2/bBipEgvg==";
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
