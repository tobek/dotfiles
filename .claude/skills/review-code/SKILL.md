---
name: review-code
description: Provide a code review for uncommitted changes or branch diff in the git repository. Only use if you are Claude! Other models should ignore this skill.
allowed-tools: Read, Bash(git:*), Grep, Glob, Task
---

# Review Code Changes

Provide a code review for uncommitted changes in the current git repository, or for the diff between the current branch and a specified branch.

**Usage:**
- `/review-code` - reviews uncommitted changes (default)
- `/review-code origin/main` - reviews diff between current branch and origin/main
- `/review-code all the changes in frontend_api/ in commit abcd123` - more specific review with instructions

**Agent assumptions (applies to all agents and subagents):**

- All tools are functional and will work without error. Do not test tools or make exploratory calls.
- Only call a tool if it is required to complete the task. Every tool call should have a clear purpose.

To do this, follow these steps precisely:

1. Determine the review mode:
   - If no arguments are provided, review uncommitted changes using `git diff HEAD`
   - If a branch argument is provided (e.g., "origin/main"), review the diff between the current branch and the specified branch using `git diff <branch>...HEAD`
   - If a more complex argument is provided, follow its instructions as requested

   Use a Haiku agent to check if there are changes to review (i.e., not trivial whitespace or comment-only changes). If no meaningful changes exist, do not proceed.

2. Use another Haiku agent to give you a list of file paths to (but not the contents of) any relevant CLAUDE.md files from the codebase: the root CLAUDE.md file (if one exists), as well as any CLAUDE.md files in the directories whose files were modified.

3. Launch a Sonnet agent to analyze the git diff and return a summary of the changes.

4. Launch 3 agents *in parallel* to independently review the changes. The agents should do the following, then return a list of issues and the reason each issue was flagged (eg. CLAUDE.md adherence, bug, code clarity, etc.):
   - Agent #1: CLAUDE.md compliance Sonnet agent. Audit changes for CLAUDE.md compliance in parallel. Note: When evaluating CLAUDE.md compliance for a file, you should only consider CLAUDE.md files that share a file path with the file or parents.
   - Agent #2: Opus bug agent. Scan for obvious bugs using only the diff itself — do not read surrounding file context. Flag only significant bugs; ignore nitpicks and likely false positives. Only flag issues that you can validate without looking at context outside of the git diff.
   - Agent #3: Opus deep-analysis agent. Look for subtle bugs, security issues, and incorrect logic in the changed code by including, as necessary, the file context beyond the diff. This can catch issues that would not be visible from the diff alone (e.g., incompatible usage of existing functions, missed edge cases, and much more).

   Each agent should be provided with the summary of changes from step #3.

5. For each issue found in the previous step #4, launch parallel subagents to validate the issue. These subagents should get the summary of changes from step #3 along with a description of the issue. The agent's job is to review the issue to validate that the stated issue is truly an issue with high confidence. For example, if an issue such as "variable is not defined" was flagged, the subagent's job would be to validate that is actually true in the code. Another example would be CLAUDE.md issues. The agent should validate that the CLAUDE.md rule that was violated is scoped for this file and is actually violated. Use Opus subagents for bugs and logic issues, and Sonnet agents for CLAUDE.md violations.

6. Filter out any issues that were not validated in step #5. This step will give us our list of high signal issues for our review.

7. Present the results to the user with the following format:
   - For issues found: List each issue, numbered, with a brief description, the file and line numbers, and why it was flagged (CLAUDE.md, bug, etc.)
   - For issues found but validated as false positives: Extremely briefly (short sentence) sumarize each, and why it is not an issue
   - For no issues: Simply state "No issues found. Checked for bugs and CLAUDE.md compliance."

Examples of false positives to avoid (for steps 4 and 5):

- Something that appears to be a bug but is actually correct
- Pedantic nitpicks that a senior engineer would not flag
- Issues for which there is no current code path nor plausible future code path that would trigger the issue (borderline cases can still be flagged as potential issues)
- Issues that a linter, typechecker, or compiler would catch (eg. missing or incorrect imports, type errors, broken tests, formatting issues, pedantic style issues like newlines). No need to run these build steps yourself -- it is safe to assume that they will be run separately as part of CI.
- General code quality issues (eg. lack of test coverage, poor documentation), unless explicitly required in CLAUDE.md
- Issues mentioned in CLAUDE.md but explicitly silenced in the code (e.g., via a lint ignore comment)
- Pre-existing issues, unless you come across a pre-existing critical logic or security bug
