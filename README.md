# Preflight Checks

Quick spike on a preflight check to ensure git-secrets is properly installed and
configured, and a script to do that configuration.

## Usage

1. Install git-secrets on every git repository in your home directory and
   configure it globally to be installed on newly cloned or initialized
   repositories:

   ```bash
   ./install.sh
   ```

2. Test that it's working properly by trying to commit a secret:

   ```bash
   ./test.sh
   ````

   The test creates a new repo and tries to commit a secret to it. git-secrets
   should stop this. If successfully stopped, the script will output a note
   saying everything is a-okay, otherwise a note that you need to debug your
   setup.
