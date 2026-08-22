Think in English; respond to the user in Japanese.

## Git and GitHub operations

- GitHub state changes that may be performed without approval are limited to creating, editing, commenting on, closing, and reopening pull requests and issues.
- Obtain the user's approval before performing any other GitHub state change.
- Never run `git push` or any other operation that updates a remote ref.
- Never merge a pull request. The user performs the final squash merge through the GitHub UI.
- Never delete an issue.
- Complete work through the local commit, then tell the user when a push is required.
- Create a pull request only when its source branch already exists on the remote.
