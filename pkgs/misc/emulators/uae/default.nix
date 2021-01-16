{lib, stdenv, fetchurl, pkgconfig, gtk2, alsaLib, SDL}:

stdenv.mkDerivation rec {
  name = "uae-0.8.29";

  src = fetchurl {
    url = "http://web.archive.org/web/20130905032631/http://www.amigaemulator.org/files/sources/develop/${name}.tar.bz2";
    sha256 = "05s3cd1rd5a970s938qf4c2xm3l7f54g5iaqw56v8smk355m4qr4";
  };

  configureFlags = [ "--with-sdl" "--with-sdl-sound" "--with-sdl-gfx" "--with-alsa" ];

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ gtk2 alsaLib SDL ];

  hardeningDisable = [ "format" ];
  LDFLAGS = [ "-lm" ];

  meta = {
    description = "Ultimate/Unix/Unusable Amiga Emulator";
    license = lib.licenses.gpl2Plus;
    homepage = "http://web.archive.org/web/20130901222855/http://www.amigaemulator.org/";
    maintainers = [ lib.maintainers.sander ];
    platforms = lib.platforms.linux;
  };
}
