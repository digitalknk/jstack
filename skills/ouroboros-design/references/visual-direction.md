# Visual direction

Read this reference for marketing pages, portfolios, editorial work, brand surfaces, or any request for a more distinctive visual result.

## Derive, do not decorate

Start with subject matter. List concrete cues from the brief such as materials, tools, environments, rituals, artifacts, terminology, photography, data, and cultural context. Translate one or two cues into layout, type, image, motion, or interaction choices. Avoid literal costume design. The connection should survive explanation.

A strong direction answers:

```text
What should the viewer notice first?
What could only belong to this subject?
What is the one memorable device?
What remains quiet so that device can work?
```

## The visual plan

Before building, settle these decisions:

- **Palette:** Semantic roles plus named color values. Account for contrast and imagery.
- **Typography:** Display, body, and utility roles as needed. Choose faces for the subject and available licensing, not novelty alone.
- **Composition:** Grid, alignment, content width, section rhythm, and mobile collapse.
- **Geometry:** Radius, border, shadow, and icon treatment with a consistent rule. Choose icons as carefully as type and words: few, from one family, each one earning its place by being clearer than the word it replaces.
- **Motion:** One or two orchestrated moments with a clear purpose. Static can be the right choice.
- **Signature:** One element the viewer could describe later and connect to the brief.

Minimal directions demand precision in spacing, type, crop, and alignment. Expressive directions demand enough implementation work to make the idea coherent. Do not choose a complex direction and ship a thin imitation.

## Anti-default review

These patterns are warnings, not bans. Use one only when the brief gives it a reason. Patterns the user has rejected outright are in [vetoed directions](vetoed.md) and are banned:

- A centered hero over a glow or mesh gradient
- Three equal feature cards as the main structure
- Bento grids without meaningful grouping
- Cream paper, display serif, and earthy accent used as generic premium shorthand
- Near-black with a neon accent used as generic technology shorthand
- Glass panels and rounded cards on every surface (pills are vetoed outright)
- Decorative numbering where order carries no information
- Alternating image and text rows repeated through the page
- Fake dashboards, terminals, testimonials, metrics, status dots, or version labels
- Gradient text, oversized headlines, or constant animation used as a substitute for hierarchy
- Key selling points in tiny, faint text ("Free", "Open source", the install command). If it matters, make it impossible to miss.
- Content behind tabs, carousels, or accordions on a marketing page. Assume visitors see only the first tab. If auto-advancing, start the timer only when the section is fully in view.
- Animation that doesn't reinforce the point. Good motion makes the idea clearer (a laptop closing "while you sleep"); everything else is decoration, and AI tends to overdo it.

The test is counterfactual: if the subject and nouns changed, would the design still be nearly identical? If yes, revise the palette, type, composition, imagery, or signature using cues from the actual brief.

Signals beyond the pixels also count. A long, thorough page and a substantial footer suggest an established company; a thin page suggests a weekend project. Choose what the page says about the company on purpose.

Do not mechanically invert every warning. A forced asymmetric layout can be as generic as a centered hero. The remedy is a reasoned choice, not novelty for its own sake.

## Typography

Typography carries much of a page's identity. Define roles deliberately:

- Use a display treatment only where scale or character supports hierarchy.
- Keep body text readable at real line lengths and viewport sizes.
- With only three sizes and few heavy weights (see SKILL.md), build hierarchy from color, spacing, position, and case. Regular and medium weights do most of the work.
- Let width, case, spacing, and line height do work before adding another family.
- Check italic and decorative faces for clipped glyphs, missing weights, language coverage, and fallback behavior.
- Use fonts already licensed and available in the product. If a new font is needed, state the source and loading strategy.

Do not avoid common fonts merely because they are common. Avoid unexamined choices. A familiar face can be correct when the product calls for neutrality, platform consistency, performance, or broad script support.

## Color and material

Use color by role. Define background, surface, text, muted text, border, primary action, focus, danger, warning, and success as needed. Keep neutral temperature and saturation coherent unless contrast between zones carries meaning.

Shadows, blur, transparency, borders, and texture should describe hierarchy or material. Provide solid, legible fallbacks when transparency or effects fail. Check the design without blur, custom fonts, or ideal imagery. It should remain understandable.

Gradients are allowed, but each one needs a reason you can state in one sentence. Good reasons: it shows a real range or change (a heat scale, a time of day, progress), it comes from the brand or the subject's own materials, it models real light or depth on an object, or it fades content to signal that more exists past an edge. "It adds depth," "it looks premium," and "the dark background felt flat" are not reasons. Never place text on a gradient (see [vetoed directions](vetoed.md)). Keep the number of gradients on a page small enough that each one still reads as deliberate.

Where a flat CSS gradient would feel cheap, a shader is often the better tool. Shaders render texture, grain, dithering, halftone, flow, and light in real time, and used with taste they can carry real material character that a gradient can't. [Paper Shaders](https://shaders.paper.design/) (`@paper-design/shaders-react`, zero-dependency) is a good starting library: grain gradient, dithering, paper texture, halftone, fluted glass, warp, god rays, and image filters for photos and logos. Shaders follow the same rules as gradients and every other element:

- Each one needs a reason you can state in one sentence, drawn from the subject (paper grain for a writing tool, halftone for a print shop, water for a weather app). A shader added for mood is the glow veto in a new costume.
- At most one shader per view, usually as the signature element. Never one per section.
- No text on a shader. Put text beside it or on a solid panel above it, same as gradients.
- Keep it slow and quiet. Motion must be subtle enough to ignore while reading; prefer a still frame (speed 0 or a static variant) unless the motion itself means something.
- Respect `prefers-reduced-motion` by rendering a still frame, pause it when it's off screen or the tab is hidden, and provide a static image or solid-color fallback when WebGL is unavailable.
- Check the cost: test on a low-end phone, keep the canvas no larger than its visible area, and don't let it delay the first useful paint.

## Imagery and evidence

Prefer real brand assets, product screenshots, supplied photography, or generated assets that the user authorized. Match the crop and aspect ratio to the composition. Avoid building a fake screenshot from decorative rectangles when the image implies a real product state.

If needed assets are unavailable:

1. Use an available image tool only when it fits the requested scope.
2. Otherwise create explicit placeholder slots with required dimensions and content notes.
3. Tell the user which assets remain before calling the page production-ready.

Alt text should describe the image's function and relevant content. Decorative images should not create screen-reader noise.

## Motion

Every animation should communicate one of these:

- Hierarchy or attention
- Causality or state change
- Spatial relationship
- Feedback after an action
- A narrative sequence that depends on timing

Prefer one composed moment over scattered effects. Animate transform and opacity when possible. Avoid continuous motion on information that should be read. Provide a static or instant reduced-motion path that preserves meaning.

## Marketing-page checks

- The first viewport makes the subject and primary action clear without stuffing every proof point into the hero.
- Navigation remains stable and readable at intermediate widths.
- Calls to action use consistent verbs for the same intent.
- Sections do not repeat the same composition until the page feels generated from a loop.
- Logos, quotes, claims, and numbers are real or labeled as samples.
- Real content, long names, missing images, and translated copy do not collapse the layout.
- The page has enough visual evidence for its claims. Decorative imagery does not pretend to be evidence.
