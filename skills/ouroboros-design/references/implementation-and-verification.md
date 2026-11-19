# Implementation and verification

Read this reference when writing or reviewing interface code.

## Work with the repository

Inspect the manifest, lockfile, framework configuration, component library, tokens, lint and test commands, and nearby patterns before editing. Use the repository's configured wrappers and conventions. Preserve unrelated changes.

Before adding a dependency:

- Confirm it is not already available.
- Decide whether native platform features or the existing system solve the need.
- Check maintenance, bundle cost, licensing, and compatibility.
- Add it only when the benefit belongs to the requested scope.

Use one component and token system. Do not mix official design systems or icon families without a product reason. Do not recreate an official system's appearance while omitting its components and behavior.

## Structure and behavior

- Use semantic HTML and native controls before custom equivalents.
- Keep source order aligned with reading, focus, and visual order.
- Build reusable components around product concepts, not arbitrary fragments.
- Use semantic tokens rather than repeated literal colors and dimensions.
- Avoid CSS selector collisions and specificity fights. Keep component variants explicit.
- Isolate animation and browser-only behavior from server-rendered or static components.
- Clean up observers, subscriptions, timers, and animation contexts.
- Do not drive per-frame pointer or scroll values through component state when motion values, CSS, observers, or animation libraries can avoid rerendering the tree.

## Banned font check

Models fall back to their favorite fonts without being asked. `scripts/check-patterns.sh` searches code, CSS, font imports, and config for them.

Any match is a failure unless the user named that font in the current brief or the existing brand already uses it. Replace it with a face chosen for the subject, and check what the fallback stack renders.

## Responsive behavior

Design around content pressure, not only standard device labels. Test narrow phones, wide phones, tablets, laptops, and a large desktop width relevant to the product.

- Prefer grid and intrinsic sizing over fragile percentage arithmetic.
- Define the collapse order for each multi-column composition.
- Use dynamic viewport units for full-height mobile regions where supported, with a suitable fallback.
- Keep navigation, dialogs, tables, forms, and calls to action usable at intermediate widths.
- Reserve media dimensions to prevent layout shift.
- Size anything that switches content to its largest state. Stack tab panels or steps in one grid cell (`grid-area: 1 / 1`, inactive panels `visibility: hidden` rather than `display: none`) so the box fits the tallest, or give it a fixed size and scroll inside. Reserve room for messages that appear in place, such as field errors and save status. Give changing labels and numbers a stable width (`min-width`, `font-variant-numeric: tabular-nums`). In a native macOS settings window, give every pane the same frame.
- Test long labels, zoom, localization, and missing content.

## Motion and performance

- Animate transform and opacity when possible.
- Avoid layout animation on large or frequently updated regions.
- Use `will-change` only while it provides a measured benefit.
- Respect `prefers-reduced-motion` for every non-essential animation.
- Lazy-load code and media that are not needed for the initial task.
- Optimize the actual largest-content element and reserve its dimensions.
- Avoid heavy blur, filters, canvas work, and perpetual animation without measuring on representative hardware.

Performance targets should come from the product or current web guidance. Do not claim a target was met without measurement.

## Accessibility verification

Check behavior, not only markup:

- Navigate every interactive element with the keyboard.
- Confirm focus is visible and follows a logical order.
- Inspect accessible names, roles, states, descriptions, and live updates.
- Check contrast for text, controls, focus indicators, errors, and content over imagery.
- Verify modals, popovers, menus, tooltips, and disclosures open, close, return focus, and work without a pointer.
- Test reduced motion and, when relevant, forced colors, zoom, text enlargement, and screen-reader output.
- Ensure hover content has a focus or persistent equivalent.

Use automated checks to find likely problems. Use manual interaction to confirm the experience.

## Rendered review

Run the real application or artifact. Inspect screenshots at representative widths and exercise important states. Compare the render with the brief and design read.

Look for:

- Weak or competing hierarchy
- Accidental overflow, clipping, wrapping, and layout shift
- Edges that move: switch every tab and step, trigger loading, error, and success states, and watch the window, panel, and button edges. Any edge that moves is a failure
- Repeated cards, labels, borders, or section rhythms without meaning
- Everything `scripts/check-patterns.sh` flags. The script finds candidates; the render decides. A `rounded-full` on a round avatar is fine, a capsule badge is not
- Every gradient: state in one sentence what it communicates. Remove any that has no answer, and move any text that sits on one onto a solid surface
- Dot status badges and mood glows, which the script can't reliably find
- Every shader or WebGL canvas: one per view at most, a stated reason, no text on it, a still frame under reduced motion, paused off screen, a fallback without WebGL, and smooth on a low-end phone
- Empty areas large enough to notice on their own: oversized section gaps, mostly blank first screens or panels, and small content floating in wide margins
- Inconsistent spacing, radii, icon style, or action vocabulary
- Every icon. Count them per screen and remove any the screen still works without
- Placeholder content that accidentally looks factual
- Poor image crops and unreadable text over media
- Missing focus, hover, pressed, loading, empty, error, and destructive states
- Motion that distracts, janks, or ignores reduced-motion settings
- Mobile layouts that merely stack without preserving task order

Make at least one critique pass after seeing the render. If the environment cannot render, state the limitation and do not claim visual verification.

## Proportional checks

Use the project's own commands first. Depending on scope, verification may include:

- Type checking, linting, unit tests, and production build
- Component or interaction tests
- Accessibility scans plus manual keyboard checks
- Visual regression or screenshot comparison
- Browser checks at relevant widths and themes
- Performance measurement for work that changes loading or animation

Report what ran, what passed, what failed, and what was not checked. A build proves compilation, not design quality.
