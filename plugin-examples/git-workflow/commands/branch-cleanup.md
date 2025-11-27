---
description: Clean up merged and stale branches
---

# Branch Cleanup Command

Remove local branches that have been merged or are stale.

## Instructions

1. **Fetch Latest**
   ```shell
   git fetch --prune
   ```

2. **Identify Merged Branches**
   Find branches merged into main/master:
   ```shell
   git branch --merged main | grep -v "main\|master\|\*"
   ```

3. **Identify Stale Remote Branches**
   Find remote branches that no longer exist:
   ```shell
   git branch -vv | grep ': gone]'
   ```

4. **Present Options**
   Show the user:
   - Branches safe to delete (merged)
   - Branches with gone remotes
   - Current branch (cannot be deleted)

5. **Confirm and Delete**
   - Ask for confirmation before deleting
   - Delete local branches: `git branch -d branch-name`
   - For unmerged branches user wants to remove: `git branch -D branch-name`

## Safety

- Never delete main, master, or develop branches
- Never delete the current branch
- Always confirm before force-deleting unmerged branches
- Show what each branch contains before deletion

## Example Output

```
Branch cleanup analysis:

Merged branches (safe to delete):
  - feature/add-login (merged 3 days ago)
  - fix/typo-readme (merged 1 week ago)

Stale branches (remote deleted):
  - feature/old-experiment

Protected branches (skipped):
  - main
  - develop

Delete 3 branches? [y/N]
```
