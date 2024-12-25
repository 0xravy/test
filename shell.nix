{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  # Set the shell name and environment variables
  name = "bun-env";

  # Define the dependencies you need
  buildInputs = [
    pkgs.sqlite
    pkgs.bun
  ];

  # Setup the Bun environment
  shellHook = ''
    # Ensure Bun is available in the shell session
    export PATH="$HOME/.bun/bin:$PATH"


    # Install sqlite3 package with Bun
    echo "Installing sqlite3 package with Bun..."
    bun add sqlite3
  '';
}
