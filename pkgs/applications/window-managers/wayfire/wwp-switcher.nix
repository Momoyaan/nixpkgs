{
  stdenv,
  lib,
  fetchFromGitHub,
  unstableGitUpdater,
  meson,
  ninja,
  pkg-config,
  wayfire,
  libxkbcommon,
  libGL,
  libinput,
  gtk3,
  glibmm,
  xcbutilwm,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "wwp-switcher";
  version = "0-unstable-2025-10-15";

  src = fetchFromGitHub {
    owner = "Momoyaan";
    repo = "wwp-switcher";
    rev = "7d964f11e129c86b2cc6cae4fa76533b5ccf1e23";
    hash = "sha256-cU8INUb+JXlSCM7cAOUBU7z7W0IM6pAGN0izGdFYntc=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    wayfire
    libxkbcommon
    libGL
    libinput
    gtk3
    glibmm
    xcbutilwm
  ];

  env = {
    PKG_CONFIG_WAYFIRE_METADATADIR = "${placeholder "out"}/share/wayfire/metadata";
  };

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    homepage = "https://github.com/Momoyaan/wwp-switcher";
    description = "Plugin to switch active window";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ wineee ];
    inherit (wayfire.meta) platforms;
  };
})
