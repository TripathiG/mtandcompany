
{ pkgs, ... }: {
  # Use the unstable channel to get the latest versions of packages
  channel = "unstable";

  # A list of packages to have available in your environment
  packages = [
    pkgs.nodejs_20  # Specify Node.js version 20
  ];

  # IDX-specific configuration
  idx = {
    # A list of VS Code extensions to install
    extensions = [
      "astro-build.astro-vscode"
      "bradlc.vscode-tailwindcss"
    ];

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Move the Astro project files to the root of the workspace
        move-astro-files = "mv popular-photon/* . && mv popular-photon/.* . 2>/dev/null || true";
        # Remove the now-empty directory
        remove-astro-dir = "rmdir popular-photon";
        # Install project dependencies
        npm-install = "npm install";
      };
      # Runs every time the workspace is (re)started
      onStart = {
        # Start the Astro development server
        start-dev-server = "npm run dev";
      };
    };

    # Configure a web preview for your application
    previews = {
      enable = true;
      previews = {
        # Name of the preview
        web = {
          # Command to start the web server
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          # Use the "web" manager for this preview
          manager = "web";
        };
      };
    };
  };
}
