{ mkImage, pkgs, lib, ... }:

# Tesseract - OCR engine
# https://github.com/tesseract-ocr/tesseract

mkImage {
  drv = pkgs.tesseract;
  name = "tesseract";
  tag = "v${pkgs.tesseract.version}";
  entrypoint = [ "${pkgs.tesseract}/bin/tesseract" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Tesseract";
    "org.opencontainers.image.description" = "Open source OCR engine";
    "org.opencontainers.image.version" = pkgs.tesseract.version;
  };
}
