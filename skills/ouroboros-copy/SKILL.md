---
name: ouroboros-copy
description: Write, edit, or review the words in a user-facing product or site, including headlines, page copy, captions, button labels, microcopy, onboarding text, maker stories, and sample content in mockups. Use alongside ouroboros-design whenever an interface needs words, and on its own for copy-only requests. Not for code comments, commit messages, or internal docs.
license: MIT
metadata:
  version: "1.2.0"
---

# Ouroboros copy

## Purpose

Write copy a visitor can read once and act on. Every line should tell the reader something they can check or do. The words carry the product's explanation; the design only gives them a place to sit.

## Read first

- Read [vetoed copy patterns](references/vetoed.md) before writing anything. Also check the repository for a project vetoed file referenced from `AGENTS.md` or `CLAUDE.md`.
- When briefing a subagent or another model to write copy, paste the full vetoed list into the brief.

## Priority order

1. The user's brief and explicit choices
2. The product's existing voice, terms, and legal or consent language
3. Honesty: no invented claims, customers, numbers, or capabilities
4. Clarity for the primary audience
5. Character and memorability

## Working method

1. **Find the facts.** Read the product, its existing copy, and the brief. List what the product does, who it is for first and second, and what problem it solves. Ask the user what the product is for first and second if it is unclear.
2. **Check the category.** Look at competing products' sites before writing, and avoid their headlines, stock examples, and pitches.
3. **Write for the primary audience.** Lead with the main use. Mention standout features in proportion. Put secondary-audience terms in that audience's section.
4. **Use real material.** Pick examples from the product's own users and story. When content is missing, write clearly labeled samples and tell the user what to replace.
5. **Edit as you write.** Check every line against the vetoed list before showing it. Cut lines that sound good but say nothing.
6. **Read it in place.** Review the copy in the rendered interface. Length, line breaks, and label fit matter as much as wording.

## Non-negotiable boundaries

- Do not fabricate testimonials, logos, metrics, claims, or capabilities.
- Button labels and menu items say what will happen.
- Keep captions to one or two short sentences.
- Say only what the reader needs at that point on the page. Someone should understand the product without reading everything.
- Never present sample content as a built-in part of the product.
- Never propose or write anything in the vetoed list, including disguised versions.
- When the user rejects a line, phrase, framing, or tone, record it as a veto before continuing, following the steps in [vetoed copy patterns](references/vetoed.md).
