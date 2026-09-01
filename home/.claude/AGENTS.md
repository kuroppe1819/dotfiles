Think in English; respond to the user in Japanese.

## Code comments

Code shows *how*; a comment carries only *why* — a non-obvious constraint, a deliberate deviation, a gotcha, or a workaround. Default to no comment.

- Never narrate the code ("loop over users", "set the flag", "// end if").
- Never restate a signature, a type, or a name that is already in the code.
- Never write change-oriented commentary ("fixed X", "updated to Y", "previously this was Z"). That belongs in the commit message.
- Never reference an ephemeral target (a spec section, a design doc, a ticket title). A comment must still make sense with every link removed. Durable breadcrumbs — issue IDs, RFCs, permalinks — are fine.
- Match the comment density of the surrounding file. If neighbouring functions carry no comments, yours carries none.
- A one-line summary on a public function is fine. Inline restatement of a single clear line is not.
- Apply Occam's razor to every comment that survives: a real *why* does not excuse verbose wording.

## Git and GitHub operations

- GitHub state changes that may be performed without approval are limited to creating, editing, commenting on, closing, and reopening pull requests and issues.
- Obtain the user's approval before performing any other GitHub state change.
- Never run `git push` or any other operation that updates a remote ref.
- Never merge a pull request. The user performs the final squash merge through the GitHub UI.
- Never delete an issue.
- Complete work through the local commit, then tell the user when a push is required.
- Create a pull request only when its source branch already exists on the remote.
