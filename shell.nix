{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  # Set the shell name and environment variables
  name = "bun-env";

  # Define the dependencies you need
  packages = [
    pkgs.sqlite
    pkgs.bun
    pkgs.stdenv.cc.cc.lib
  ];

  # Setup the Bun environment
  shellHook = ''
      env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.stdenv.cc.cc.lib];

      # Ensure Bun is available in the shell session
      export PATH="$HOME/.bun/bin:$PATH"


      # Install sqlite3 package with Bun
      echo "Installing sqlite3 package with Bun..."
      bun add sqlite3
    bun run dev
  '';
}
