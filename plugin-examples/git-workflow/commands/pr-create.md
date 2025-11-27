---
description: Create a pull request with a structured description
---

# PR Create Command

Create a well-structured pull request for the current branch.

## Instructions

1. **Gather Information**
   - Run `git status` to check for uncommitted changes
   - Run `git log main..HEAD` (or appropriate base branch) to see commits
   - Run `git diff main...HEAD` to understand the full changeset

2. **Generate PR Content**
   - Create a concise, descriptive title
   - Write a summary section with bullet points
   - Include a test plan section
   - Link related issues if mentioned in commits

3. **Create the PR**
   Use the gh CLI to create the PR:
   ```shell
   gh pr create --title "Title" --body "$(cat <<'EOF'
   ## Summary
   - Change 1
   - Change 2

   ## Test Plan
   - [ ] Test case 1
   - [ ] Test case 2

   ## Related Issues
   Closes #123
   EOF
   )"
   ```

4. **Handle Edge Cases**
   - If no commits ahead of base, inform user
   - If uncommitted changes exist, ask if they should be committed first
   - If branch not pushed, push with `-u` flag first

## Options

- `/pr-create` - Create PR against default branch (main/master)
- `/pr-create develop` - Create PR against specific base branch
- `/pr-create --draft` - Create as draft PR

## Output

Return the PR URL so the user can view it directly.
