{ pkgs }:

pkgs.writeShellApplication {
  name = "install-nix-bwrap-apparmor";
  runtimeInputs = [ pkgs.coreutils ];
  text = ''
    if [[ "''${1:-}" == --help ]]; then
      echo "Usage: install-nix-bwrap-apparmor"
      echo "Install and load the Nix Bubblewrap AppArmor profile using sudo."
      exit 0
    fi
    if (( $# != 0 )); then
      echo "Usage: install-nix-bwrap-apparmor" >&2
      exit 1
    fi

    if (( EUID != 0 )); then
      exec /usr/bin/sudo -- "$0"
    fi

    # Use the host parser and includes to match its AppArmor installation.
    parser=/usr/sbin/apparmor_parser
    profile=${./apparmor/nix-bwrap-userns-restrict}
    destination=/etc/apparmor.d/nix-bwrap-userns-restrict

    if [[ ! -x "$parser" || ! -d /etc/apparmor.d ]]; then
      echo "The host AppArmor installation is required." >&2
      exit 1
    fi

    # Validate before replacing the installed profile; do not touch caches.
    "$parser" --skip-kernel-load --skip-cache --base /etc/apparmor.d "$profile"
    install -o root -g root -m 0644 "$profile" "$destination"
    "$parser" --replace "$destination"
    echo "Installed and loaded $destination"
  '';
}
