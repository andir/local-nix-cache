{ pkgs }:
{
  actix-web = attrs: {
    features = [];
  };

  bzip2-sys = attrs: {
    buildInputs = [ pkgs.bzip2 ];
    propagatedBuildInputs = [ pkgs.bzip2 ];
    extraLinkFlags = [ "-L${pkgs.bzip2.out}/lib" ];
  };

  libnixstore-sys = attrs: {
    propagatedBuildInputs = [ pkgs.libnixstore-c ];
    buildInputs = [ pkgs.libnixstore-c ];
    nativeBuildInputs = [ pkgs.pkgconfig ];
    LIBCLANG_PATH= "${pkgs.llvmPackages.clang-unwrapped.lib}/lib";
    EXTRA_INCLUDE = "${pkgs.stdenv.cc.libc_dev}/include";
  };

  multicast_dns = attrs: {
    nativeBuildInputs = [ pkgs.pkgconfig ];
    buildInputs = [ pkgs.avahi pkgs.dbus ];
  };

  local-nix-cache = attrs: {
    buildInputs = [ pkgs.libnixstore-c pkgs.avahi pkgs.dbus ];
#    extraLinkFlags = [ "-L${pkgs.bzip2}/lib" "-lbz2"];
  };

}
