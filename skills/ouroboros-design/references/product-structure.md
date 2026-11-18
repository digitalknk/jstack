# Product structure

Read this reference for apps, dashboards, forms, onboarding, settings, AI interfaces, and other multi-state workflows.

## Start with the job

Define:

```text
Primary user:
Job to complete:
Entry point:
Primary action:
Required information:
Decision points:
Completion signal:
Recovery path:
Permissions and sensitive data:
```

Design the shortest understandable path through that job. Familiar patterns are useful when they lower learning cost. Give the product visual character through typography, composition, language, and carefully chosen moments, not by making core controls unfamiliar.

## Information architecture

- Keep the current location and available next actions visible.
- Separate frequent primary work from configuration and rare destructive actions.
- Reveal complexity when the user needs it instead of flattening every option onto one screen.
- Preserve stable navigation and user state across errors, refreshes, and interrupted work when practical.
- Use cards only when grouping or elevation communicates a real relationship.
- On dashboards, rank signals by decision value. State time range, source, freshness, units, and uncertainty. Avoid false precision.

## State model

Cover the states that can occur, not a ritual list. Common states include:

- Initial, loading, partial, empty, populated, and no results
- Focused, hovered, pressed, selected, disabled, and read-only
- Validation failed, operation failed, retrying, and rate limited
- Offline, stale data, conflict, and unsaved changes
- Permission required, authentication required, and authorization denied
- Long-running, queued, paused, cancelled, completed, and undo available
- Destructive confirmation and destructive failure

For an important state, specify:

```text
State:
User sees:
User can do:
System preserves:
System announces:
Recovery:
```

Loading placeholders should resemble the final content when that improves stability. Empty states should say what's missing, what will appear there, and what to do about it, with the action as a clear button where the content would be. A blank screen or a bare "No items" is not an empty state. Errors should state what happened, what was preserved, and what the user can do.

Ask for a permission (location, notifications, contacts, camera) at the moment a feature needs it, so the reason is obvious, never in a burst at launch. When it helps, show a short screen first explaining why and how the data is used. On iOS that screen's only button must be "Continue" or "Next" and must lead straight to the system prompt: no "Allow" wording and no "Not now" or close, or App Review rejects the app under 5.1.1(iv). If the user declines, keep the app usable with an alternative (typing an address instead of sharing location), and offer a Settings link only after they've said no.

## Forms and settings

- Use persistent labels. Do not use placeholders as labels.
- Match input type, keyboard, autocomplete, and validation timing to the data.
- Place errors next to the affected input and associate them programmatically.
- Preserve entered values after recoverable errors.
- Name actions by outcome, such as `Save changes`, `Delete workspace`, or `Retry upload`.
- Distinguish draft, saved, saving, failed, and conflict states.
- Make defaults safe and explain consequential choices before commitment.
- Require confirmation close to irreversible actions and offer undo when the product can support it.
- Never build one long scrolling page of options. Group settings into named sections or pages (sidebar navigation, tabs, or steps), keep each view to a small set of related choices, lead with common options, and move rare ones under "Advanced". Long forms become steps with visible progress.

## AI interfaces

Make automation boundaries visible. Consider:

- Generating, tool running, waiting for confirmation, and failed tool states
- Sources available, sources missing, and uncertain output
- User-edited output and the difference between suggestion and committed action
- Retry, revise, cancel, undo, and history behavior
- Permission scope, sensitive data exposure, and audit records
- Human confirmation before high-impact or external actions

Do not make uncertain output look authoritative. Do not claim an action happened until the system has evidence that it did.

## Trust and sensitive workflows

For authentication, money, healthcare, education, children, workplace monitoring, personal data, or operations, specify:

- What data is visible, masked, copied, exported, or logged
- Which role can perform each action
- What happens on timeout, revocation, denial, or partial failure
- How users review consequences before commitment
- How the interface avoids exposing secrets in shared screens, notifications, URLs, and logs

For AI products that read personal or company data, make trust visible in the interface and marketing: what is collected, where it is stored and for how long, whether it trains models, and what leaves the device. Consider a "Trust and security" link in the main navigation.

Use least privilege, explicit consent, recoverable defaults, and plain descriptions of consequences.

## Accessibility baseline

- Semantic elements and programmatic names
- Complete keyboard operation and visible focus
- Logical focus and reading order
- Labels, instructions, and errors associated with controls
- State communicated by more than color
- Text and control contrast appropriate to their size
- Touch targets at least 44×44 pt on Apple platforms and 44×44 CSS px on the web, with space between them. A control that looks small (a text link like "Skip") gets a larger invisible hit area. No hover-only information
- Reduced-motion behavior
- Announced asynchronous changes when they matter
- Modal focus containment, escape behavior, and focus return
- Zoom, reflow, text enlargement, and localization resilience

When an aesthetic direction conflicts with these requirements, keep the intent and change the execution.
