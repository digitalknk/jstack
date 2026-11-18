---
name: ouroboros-design
description: Design, redesign, critique, or implement user-facing interfaces with both product judgment and a distinctive visual point of view. Use for websites, landing pages, apps, dashboards, forms, onboarding, design systems, AI interfaces, and other digital products when the work must be useful, accessible, subject-specific, and production-ready. Do not use for purely backend or non-interface code changes.
license: Apache-2.0 and MIT. See LICENSE.txt
metadata:
  version: "1.0.0"
---

# Ouroboros design

## Purpose

Make interfaces that are clear enough to use, specific enough to remember, and sound enough to ship. Treat product structure, words, visual direction, interaction, accessibility, and implementation as one design problem.

The name describes the working loop:

```text
inspect -> frame -> direct -> structure -> build -> observe -> critique -> reduce -> repeat
```

Do not stop at a plausible first render. Inspect the result in its real medium, use what you learn to revise the underlying direction, and repeat until the design and implementation agree.

## Priority order

When principles conflict, use this order:

1. The user's brief and explicit choices
2. Existing product, brand, platform, and repository constraints
3. User comprehension, accessibility, safety, privacy, and honest behavior
4. Subject-specific visual character
5. Maintainability, performance, and durability

Distinctiveness never excuses a usability or accessibility regression. Familiarity never excuses a generic result.

## Read only what the task needs

- For every task, read [vetoed directions](references/vetoed.md) before proposing or building anything. Also check the repository for a project vetoed file referenced from `AGENTS.md` or `CLAUDE.md`.
- For visual direction, marketing pages, portfolios, editorial surfaces, or requests to make a design less generic, read [visual direction](references/visual-direction.md).
- For apps, dashboards, forms, onboarding, settings, AI interfaces, or any workflow with meaningful state, read [product structure](references/product-structure.md).
- When implementing or reviewing frontend code, read [implementation and verification](references/implementation-and-verification.md).
- When the work needs headlines, page copy, captions, microcopy, or sample content, use the `ouroboros-copy` skill for the words. This skill covers how they look and where they sit.
- When the user names a designer, movement, philosophy, or asks for design lineage, read [design lineage](references/design-lineage.md).

## Working method

### 1. Inspect before proposing

For existing work, inspect the actual artifact and its rendered state before changing it. In a repository, identify:

- Framework, dependencies, configured commands, and platform conventions
- Existing components, tokens, typefaces, icons, assets, and content
- Routes, navigation, forms, analytics hooks, SEO contracts, and accessibility behavior that must survive
- Current responsive behavior and important loading, empty, error, permission, and destructive states
- User-owned changes and other constraints in the working tree

Classify a redesign as one of these:

- **Preserve:** Keep the recognizable brand, information architecture, and behavior. Improve craft within them.
- **Evolve:** Keep the product's identity and contracts, but allow targeted structural and visual changes.
- **Overhaul:** Establish a new direction while preserving only the content and behavior the brief requires.

If the mode is unclear and the choices would produce materially different work, ask one concise question. Otherwise state the assumption and proceed.

### 2. Frame the design read

Answer this internally before styling:

```text
This is a [surface] for [primary user] who needs to [goal] in [context].
The design should feel [posture] because [reason].
Its most characteristic cue is [subject or brand cue].
The main risk is [failure mode].
```

Capture only the decisions that change the work:

```text
Primary action:
Success criteria:
Non-goals:
Existing constraints:
Design posture:
Signature idea:
```

If nobody has said what the design must get across, ask before designing: the one idea it centers on, and what a visitor should leave knowing. Everything else branches from that answer.

Show this read when the user asked for a plan, when the direction needs agreement, or when it explains a consequential assumption. Do not make the user read a design diary before seeing useful work.

### 3. Find a direction rooted in the subject

Use the product's own materials, language, tools, data, audience, setting, and brand assets as the source of visual decisions. Do not begin with a fashionable layout and pour the brief into it.

In private reasoning, consider at least two plausible directions. Compare each against the brief, existing identity, content, implementation cost, accessibility, and likely shelf life. Choose one coherent direction and name one justified signature element. Spend visual boldness there, then keep supporting decisions disciplined.

If calibration helps, infer these dials from the brief instead of using fixed defaults:

```text
COMPOSITION_VARIANCE: 1 predictable <-> 10 experimental
MOTION_INTENSITY: 1 still <-> 10 choreographed
VISUAL_DENSITY: 1 spacious <-> 10 compressed
```

The dials are decision aids, not a required user-facing form. A high value is not better. Regulated, operational, or accessibility-critical work often needs less variance and motion. Dense professional tools may need high density without visual noise.

### 4. Structure the experience before styling it

Define the primary and secondary actions, navigation model, content hierarchy, input and output flow, state transitions, recovery paths, and authorization boundaries. Remove choices and elements that do not help the user's task.

For marketing and landing pages, start from one central idea and let the page structure follow from it. Do not start from a list of sections such as hero, features, audience, and call to action. A section list produces the template. The page must still tell a visitor what the product is and why they would want it; the central idea has to carry that explanation, not replace it. Pace everything after that: detail appears as the visitor goes looking for it, so the site feels explored rather than delivered.

Use real content where available. Do not invent customer logos, testimonials, metrics, precision, product capabilities, legal claims, or technical facts. When content or imagery is missing, use clearly labeled sample data or placeholders and identify what the user must replace.

### 5. Build a small coherent system

Reuse the product's system when it exists. Otherwise define only what this interface needs:

- Type roles and a scale of no more than three font sizes
- Semantic color and surface roles
- Spacing and layout rhythm
- Shape, border, elevation, and icon rules
- Component variants and interaction states
- Motion purpose and reduced-motion behavior
- Action vocabulary: one consistent verb for each kind of action across buttons, menus, and messages

Every structural or visual device must encode something real. Numbering implies sequence. Elevation implies hierarchy. Color implies role or state. Motion implies causality, feedback, or change. Remove devices that only make the screen look busier.

### 6. Implement within the product

The existing stack and platform conventions win. Check dependencies before importing them. Do not replace a framework, component system, icon family, or styling approach for aesthetic convenience. If the product is built on an official design system, use its real components and tokens rather than an imitation.

Keep behavior complete and testable, and make content and user state survive errors where practical.

### 7. Observe the result and close the loop

Run the configured checks and inspect the rendered interface at representative viewport sizes. Exercise the important states and interactions. Use screenshots or recordings when available because many hierarchy, overflow, contrast, and rhythm problems are invisible in source code.

Critique the result against the brief:

- What looks interchangeable with unrelated products?
- What competes with the primary task?
- What breaks with long, missing, translated, or real data?
- What becomes unclear by keyboard, touch, screen reader, poor network, or reduced motion?
- What effect, label, dependency, or component can be removed?
- Could a template or a typical AI-built site have produced this? If yes, the work fails. Tell the user it failed and why. Do not soften the verdict to "plain" or "safe."
- Does anything match an entry in the vetoed list, including in disguise?

Revise the direction or system when the problem is structural. Do not patch a weak composition with more decoration.

## Task modes

### Create or implement

Produce the working artifact when the user asked to build. Keep planning compact, then implement, render, critique, revise, and verify. Match the repository's established workflow and preserve unrelated changes.

### Redesign

Audit first. Record what must remain recognizable or contractually stable. Compare the current render with the requested direction, then change the smallest layer that solves the problem. Do not silently change URLs, navigation labels, form field names, consent language, analytics identifiers, or other external contracts.

### Critique

Lead with the few issues that most affect task success or visual identity. For each, give the observed evidence, the change, and the reason. Distinguish defects from taste choices. Do not demand novelty when the context calls for quiet familiarity.

### Specification

Provide enough detail to implement without inventing major decisions. Cover relevant flows, hierarchy, components, tokens, interaction rules, states, responsive behavior, accessibility, and acceptance criteria. Omit sections that do not fit the task.

## Non-negotiable boundaries

- The brief wins. Do not ban a font, palette, layout, or aesthetic that the user explicitly chose.
- Accessibility and honest behavior are baseline requirements, not optional polish.
- Do not use eyebrow headings in generated interfaces. Omit kicker text, overlines, and small labels above page or section headings.
- Do not use subheadings in generated interfaces. Omit subtitles, secondary headlines, and nested headings beneath page or section headings. Put necessary supporting information in ordinary body text.
- Think about the human: they are in a rush. The primary action must be visible and usable on the first screen without extra clicks, and there is one primary action per view.
- Never use Instrument Serif or Space Grotesk.
- Stick to three font sizes per interface: one display, one body, one small. An existing product type scale wins when the task is preserving or evolving that product.
- Avoid bold and black-weight text as much as possible, especially in black or near-black. Carry emphasis with size, color, and spacing instead.
- Never present a long list of options as a single page. Break settings, forms, and option sets into named sections or pages.
- Nothing goes on the plate that isn't meant to be eaten. Every element, icon, stripe, glow, badge, label, border, and gap must carry part of the message. If removing it loses nothing the user needs, remove it.
- Do not fabricate content or evidence to make a design look finished.
- Do not use aesthetic work as permission to rewrite product strategy, information architecture, or repository foundations outside the request.
- Do not add motion without a communication purpose, and never let it compete for attention. Respect reduced-motion preferences.
- Do not make every surface expressive. Spend character where it helps recognition, orientation, or meaning.
- Never propose or build anything in [vetoed directions](references/vetoed.md) or the project's vetoed file, including disguised versions. Only the user can lift a veto, by asking for that exact thing in the current brief.
- When the user rejects a direction, layout, motif, or interaction, record it as a veto before continuing, following the steps in [vetoed directions](references/vetoed.md).
- When briefing a subagent or another model, paste the full vetoed lists into the brief. Do not rely on it finding the files.

## Before finishing

Run this list on the rendered interface, fix what fails, and run it again. Code checks alone don't count; if you can't render, say so.

```text
- [ ] Run `sh scripts/check-patterns.sh <project dir>` from this skill's folder. It flags banned fonts, pills, one-sided borders, tracked uppercase, gradients, shaders, heavy weights, and more than three font sizes. Fix each hit or state why it stays
- [ ] The plate: justify every element, icon, border, and gap in one sentence, or cut it
- [ ] Vetoes: compare the render with every entry in the vetoed lists, including disguised versions
- [ ] One primary action per view, visible on the first screen; red only on destructive actions
- [ ] Touch targets at least 44×44; empty states explain and offer the next action
- [ ] States: loading, empty, error, and destructive states render and recover
- [ ] Access: keyboard, focus, screen reader, reduced motion, and narrow viewports work
- [ ] Critique pass: answer the step 7 questions; if a template or typical AI-built site could have made this, it fails
```
