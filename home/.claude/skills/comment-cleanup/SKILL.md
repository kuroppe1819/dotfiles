---
name: comment-cleanup
description: Prune AI-written comment noise from code — narration, change commentary, references to moving targets, bloated rationale, and stale descriptions — keeping only the non-obvious why. Use when the user asks to clean, tidy, or prune comments, wants a "comment pass", says there are "too many comments", or asks to "de-AI the comments".
---

<what-to-do>

This is a comment-only pass. Do not change code, formatting, or behaviour — if a comment can only be fixed by changing the code, leave the comment and report it as a possible refactor instead.

Determine the scope first. Unless the user names files, run against the uncommitted diff (`git diff`, `git diff --staged`, and untracked files). Read each affected file in full — a comment's fate depends on its neighbours.

Then apply the six tests below to every comment in scope, in order.

</what-to-do>

<tests>

## 1. Narration

Delete any comment that describes what the next lines do, restates a signature or a name, or marks a block boundary.

```
// loop over the users        → delete
// returns the parsed config  → delete
} // end if                   → delete
```

## 2. Change narration

Delete any comment addressed to a diff reviewer rather than to a future reader: "fixed X", "updated to Y", "previously this was Z", "note: now uses the new API".

Test: does this make sense to someone reading the file fresh, with no knowledge of the change that introduced it? If not, delete it. That information belongs in the commit message.

## 3. Moving targets

Delete or rewrite any comment whose meaning depends on something that will drift: a spec section number, a design doc heading, a ticket title, "see the plan above".

If the referenced substance is small, encode it directly in the comment and drop the pointer. If it is large, delete the comment.

Preserve durable breadcrumbs: issue IDs, RFC numbers, permalinks, and README paths that are stable and maintained.

## 4. Bloated rationale

Trim comments that explain the wider system when only a local fact is needed. Multi-sentence architectural narration in a function body belongs in a doc, not here.

Apply Occam's razor to every surviving why: a real reason does not excuse verbose wording. One line is usually enough.

## 5. Staleness

Delete or correct any comment that no longer matches the code it sits on.

## 6. Keep test

Keep a comment when it carries something the code cannot:

- a non-obvious constraint or invariant ("must stay below N — the caller steps by the difference")
- a deliberate deviation from the obvious approach, and why
- a gotcha in an external system or library
- an edge case the code handles but does not announce
- a cross-file synchronisation obligation ("update the enum in X when this changes")
- the semantics of an opaque data literal
- a one-line summary on a public function
- a TODO. TODOs are fine without an issue ID, but they are markers, not substitutes for the work.

When a comment is borderline, keep it. Deleting a real why is worse than leaving one extra line.

</tests>

<reporting>

After the pass, report:

- counts: deleted / rewritten / kept
- any judgement call worth a second opinion, with the comment and your reasoning
- any comment that survived only because fixing it needs a code change, named as a possible refactor
- any TODO you found that defers real work

Keep the report short. Do not restate every deletion.

</reporting>
