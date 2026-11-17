---
name: the-algorithm
description: Simplify before building or automating, using the five-step algorithm from Tesla and SpaceX (question requirements, delete, simplify, speed up, automate last). Use before automating a workflow (cron jobs, CI pipelines, n8n or Zapier flows, scripts, agents), when planning a new feature, tool, or system, when auditing a bloated process, codebase, or tool stack, and when a workflow keeps breaking or slowing down. Not for small, well-scoped tasks like fixing a bug, formatting data, or a one-off query.
license: MIT
metadata:
  version: "1.0.0"
---

# The Algorithm

Five steps, in order. Each step only pays off if the one before it is done. The most expensive mistake is running them backwards: automating a process, then speeding it up, then polishing it, without ever asking whether it should exist.

Agents lean hard toward step 5. Asked for a workflow, they build the automation around whatever requirements they were handed. This skill is the brake.

The framework comes from post-mortems on costly mistakes at Tesla and SpaceX, where the classic failure was automating broken processes too early. Jon McNeill teaches it as a journey in simplification.

## 1. Question every requirement

Every requirement needs a reason and an owner who can explain it. "Standard practice," "we've always done it," and "the template has it" are not reasons. A requirement from a smart or senior source deserves the same question; those are the ones people stop checking.

- For each requirement, write the reason in one line. If you can't, it is a candidate to cut.
- Look hardest at defaults inherited from a tool, framework, template, or industry habit. Ask what the result would look like if the default were wrong. A 12-page document might be one paragraph. A paid platform might be a spreadsheet.
- Requirements the user stated in this conversation are theirs. Question them out loud with a recommendation; never drop them silently.
- Legal, safety, security, and accessibility requirements stay. You can still simplify how they are met.

## 2. Delete steps and parts

Map the process end to end as discrete steps. Then mark the steps the customer or end user actually pays for or would notice if missing. Internal documents, handoffs, status syncs, duplicate checks, approval layers, and wrapper abstractions usually fail that test.

- Build the new process around the marked steps and delete the rest.
- In code, this means dead paths, unused config, abstractions with one caller, dependencies that do one small thing, and services that only relay.
- Delete more than feels comfortable. If nothing ever has to be added back, you didn't delete enough. Adding a step back is cheap; carrying a useless one forever is not.

## 3. Simplify and optimize what's left

Only now make the remaining steps better. Optimizing a step that should have been deleted is the most common waste in engineering.

- Run the simplified process by hand before building tooling for it. For an agent that means doing the task directly once: run the commands in the shell, process a real sample, make the change by hand, and check the result is exactly right.
- Fix what's awkward while it's still cheap to change. No pipelines, schedulers, webhooks, or frameworks in this step.

## 4. Speed it up

Speed is the great revealer. Run the process faster and at higher volume and watch where it breaks, stalls, or drops in quality.

- Use real inputs and more of them: the full dataset instead of a sample, ten runs instead of one, the slow network, the large file.
- Fix the cause of each failure. Don't wrap it in retries, timeouts, and fallbacks that hide it.
- Keep the loop short. If one cycle takes days, finding a way to make it take minutes is part of this step.

## 5. Automate last

Automate only once the process is simple, correct, and holding up at speed. Then automate the proven steps, and only those.

- Keep the automation small, readable, and easy to delete. It will need weeding when requirements change.
- If the automation needs many special cases, go back to step 2. The process isn't simple yet.

## How to apply it

Scale the effort to the task. A small script needs a few sentences of thought; a new system or an audit of an old one needs the full walk.

- Make the technical calls yourself: what to cut, delete, simplify, and how to test at speed. Act on them and report what you removed and why.
- Come back to the user only for calls that are theirs: cutting a requirement they stated, changing what the product does, removing something they own, or anything costly to reverse.
- If the user already decided how something should work, build that. Use the algorithm on the parts that are still open, not to reopen settled decisions or to justify a stopgap. "Do it by hand first" means proving the process once, not shipping the manual version instead of the planned one.
- Report briefly: what you cut and why, the process that's left, what broke at speed and how you fixed it, and what you automated. Leave out any step where you found nothing.
