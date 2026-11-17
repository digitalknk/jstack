---
name: the-algorithm
description: Simplify before building or automating, using the five-step algorithm from Tesla and SpaceX (question requirements, delete, simplify, speed up, automate last). Use before automating a workflow (cron jobs, CI pipelines, n8n or Zapier flows, scripts, agents), when planning a new feature, tool, or system, when auditing a bloated process, codebase, or tool stack, and when a workflow keeps breaking or slowing down. Not for small, well-scoped tasks like fixing a bug, formatting data, or a one-off query.
license: MIT
metadata:
  version: "1.1.0"
---

# The Algorithm

Run the five steps in order. Each one only pays off once the one before it is done. The framework came from post-mortems on costly mistakes at Tesla and SpaceX, where the classic failure was automating a broken process. Agents make that mistake by default: asked for a workflow, they build the automation around whatever requirements they were handed.

Scale the effort to the task. A small script needs a few sentences of thought; a new system or an audit needs the full walk.

## Steps

```text
- [ ] 1. Question every requirement
- [ ] 2. Delete steps and parts
- [ ] 3. Simplify and optimize what's left
- [ ] 4. Speed it up
- [ ] 5. Automate last
```

### 1. Question every requirement

Every requirement needs a one-line reason and an owner who could defend it. "Standard practice," "the template has it," and "we've always done it" are not reasons. Requirements from smart or senior sources get the same question; those are the ones nobody checks.

Look hardest at defaults inherited from a tool, framework, template, or industry habit, and ask what the result would be if the default were wrong. A 12-page document might be one paragraph. A paid platform might be a spreadsheet.

### 2. Delete steps and parts

Map the process end to end as discrete steps, then mark the ones the customer or end user pays for or would miss. Build around the marked steps and delete the rest. Internal documents, handoffs, status syncs, duplicate checks, approval layers, single-caller abstractions, and services that only relay usually go.

Delete more than feels comfortable. If nothing ever has to be added back, you didn't delete enough.

### 3. Simplify and optimize what's left

Run the simplified process by hand once before building any tooling: run the commands in a shell, process a real sample, make the change directly, and check the output is exactly right. Fix what's awkward while it is still cheap to change.

### 4. Speed it up

Speed is the great revealer. Run the process faster and at higher volume with real inputs (the full dataset, ten runs instead of one, the large file, the slow network) and watch where it breaks, stalls, or loses quality. Fix each cause. If one cycle takes days, getting it to minutes is part of this step.

### 5. Automate last

Automate the proven steps and only those. Keep it small, readable, and easy to delete. If the automation needs many special cases, go back to step 2.

## Gotchas

- **Questioning is not dropping.** A requirement the user stated in this conversation is theirs. Challenge it out loud with a recommendation; never drop it silently. Legal, safety, security, and accessibility requirements stay, though how they're met can get simpler.
- **Don't reopen settled decisions.** If the user already decided how something should work, build that and apply the algorithm only to what's still open. "Do it by hand first" means proving the process once, not shipping the manual version in place of the planned one.
- **Deleting means deleting.** Commenting code out, hiding it behind a feature flag, or keeping a "legacy" path is not deletion. Version control is the backup.
- **Don't optimize before deleting.** Caching, parallelism, batching, and faster tools applied to a step that should not exist are the most common waste. Finish step 2 first.
- **Don't hide failures found at speed.** Retries, longer timeouts, broad try/except, and fallbacks that mask a failure undo step 4. Fix the cause, then add a retry only where the failure is genuinely external and transient.
- **Scaffolding is automation.** A scheduler, CI pipeline, webhook, queue, or framework set up "for later" during steps 1 to 3 is step 5 done early.
- **Know whose call it is.** Cutting, deleting, and simplifying inside the task is yours: do it and report it. Cutting a stated requirement, changing what the product does, removing something you don't own (shared config, other people's code, production data), or anything costly to reverse goes to the user first.

## Report

Use this shape. Omit any section where you found nothing.

```markdown
**Cut:** requirement or part, and the one-line reason it went
**Process now:** the remaining steps, one line each
**Broke at speed:** what failed under volume or speed, and the fix
**Automated:** what, and how to remove it
**Needs you:** cuts that are the user's call, each with a recommendation
```
