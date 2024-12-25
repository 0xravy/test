{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  # Set the shell name and environment variables
  name = "bun-env";

  # Define the dependencies you need
  buildInputs = [
    pkgs.nodejs
    pkgs.sqlite
    pkgs.curl
  ];

  # Setup the Bun environment
  shellHook = ''
    # Install Bun if it's not already installed
    if ! command -v bun &> /dev/null; then
      echo "Bun is not installed. Installing Bun..."
      curl -fsSL https://bun.sh/install | bash
      export PATH="$HOME/.bun/bin:$PATH"
    else
      echo "Bun is already installed."
    fi

    # Ensure Bun is available in the shell session
    export PATH="$HOME/.bun/bin:$PATH"


    # Install sqlite3 package with Bun
    echo "Installing sqlite3 package with Bun..."
    bun add sqlite3
  '';
}
