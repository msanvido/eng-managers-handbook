# Handbook — Remaining Work

Remaining items from the editorial pass done April 2026. Excluded from the Jekyll build (see `_config.yml`).

Grouped by category, ordered by impact within each group.

---

## 1. Needs Marco's voice (can't be written by an editor)

### 1.1 War stories in DevOps and Security chapters
**Where:** `infrastructure/devops.md`, `infrastructure/security.md`
**What:** The chapters still read as "here's what good looks like" rather than "here's what I did and what broke." Drop in 3–5 specific moments:
- First SOC2 audit that nearly derailed a quarter
- The incident that made you finally fix on-call
- The compliance ask that blindsided you
- A DevOps transformation that worked — or didn't
- A security close-call that changed how you run the team

**How to proceed:** Marco drafts rough anecdotes (even as bullets), Claude edits them in with matching voice.

### 1.2 Opinionated anecdotes in Resources/Budgets
**Where:** `resources/budgets-headcount.md`
**What:** The compensation and budget sections are competent but impersonal. One or two war stories would carry the chapter:
- A comp-inversion situation you had to unwind
- A headcount plan that blew up
- A tough comp conversation that went well (or badly)
- A budget cut that forced a real choice

### 1.3 Replace generic agile content with first-person account
**Where:** `delivery/eng-operations.md`, the Agile Methodologies section
**What:** The Scrum/Kanban comparison is competent scaffolding, but the editor flagged it as generic. A first-person account — "here's what happened when we tried Scrum with a 5-person team" — would be stronger.
**Keep:** the core frame (Scrum/Kanban/hybrid) for readers who need the vocabulary.
**Replace:** the "making agile work" section with a real story.

---

## 2. Content gaps — P1 items not yet written

### 2.1 Remote/Hybrid chapter (new)
**Where:** Likely a new chapter at `people/remote-hybrid.md` (or a new subsection in Part II), nav_order ~4.
**Length:** ~100–150 lines.
**Cover:**
- Async-first culture, written down
- Trust across time zones — what actually builds it, what doesn't
- When remote-first breaks down (and what to do about it)
- Hybrid: the worst of both worlds, and how to avoid that
- The onboarding gap — remote new-hires ramp slower, what to do
- Managing your own isolation as a remote-first EM

**Current state:** a tight section exists inside `people/fundamentals.md` ("Remote and distributed teams"). The chapter would expand and replace it.

### 2.2 Managing Managers appendix (new)
**Where:** New `management-of-managers/` part, or as an appendix, nav_order ~8.
**Length:** ~100 lines.
**Cover:**
- The shift from direct to indirect leverage
- Coaching your first-line EMs (skip-levels that don't step on them)
- Calibration across teams you don't manage directly
- When a first-line EM isn't working out
- Your own role drift — from doing to enabling

**Why:** The book stops at first-line management. Readers whose orgs grow past ~25 engineers start managing leads/other EMs and have no guidance here.

---

## 3. Layout polish — P2

### 3.1 Dark mode toggle UI
**Where:** Add to `_includes/head_custom.html` or equivalent.
**What:** Both `just-the-docs-light.css` and `just-the-docs-dark.css` are compiled, but there's no user-facing toggle. Need a small JS snippet that:
- Respects `prefers-color-scheme` on first load
- Stores the user's choice in `localStorage`
- Swaps the stylesheet `href` at runtime
- Exposes a sun/moon toggle button in the header

Reference implementation in just-the-docs issues/discussions.

### 3.2 Prev/Next chapter navigation
**Where:** `_layouts/chapter.html`.
**What:** Add a footer block that walks `site.pages` in nav_order and renders "← Previous: [title] | Next: [title] →". Two parts:
- Find the current page's `nav_order` within its parent
- Find the adjacent pages (previous and next) in the same parent
- Handle the cross-part case — going from last chapter of Part II to first chapter of Part III

Not shipped by just-the-docs; needs ~30 lines of Liquid.

### 3.3 Open Graph social card image
**Where:** `_config.yml` (for jekyll-seo-tag) and possibly `_includes/head_custom.html`.
**What:** Set a site-wide OG image (probably `image.webp` or a variant sized for social previews — usually 1200×630). When someone shares a link to the book on Slack/Twitter/LinkedIn, a proper preview card renders.

### 3.4 Per-part cover images (optional stretch)
Each part-index page currently has only an eyebrow + lede. A small visual motif per part (icon or photo) would read more like a book and less like docs.

---

## 4. Editorial polish — always last

### 4.1 Full copyedit pass
**Where:** All chapters.
**What:** A human read-through — ideally Marco's. Claude wrote several thousand lines in Marco's voice; a pass to catch overreach, tone mismatches, and "that's not how I'd say it" moments is mandatory before publication.

**Priority order:**
1. The new chapters (First 90 Days, AI Era) — highest risk of overreach
2. What is Management — rewritten from intro content, voice may have drifted
3. Delivery chapters (all four split from product.md) — heavily re-voiced
4. People Fundamentals, Performance & Development — moderately re-voiced
5. Hiring & Onboarding, OKRs sections — mostly original, lightest editing

### 4.2 Voice consistency check
**Where:** Chapters that were *lightly* edited vs. heavily rewritten.
**What:** Mostly-original chapters (Hiring & Onboarding, first half of Performance & Development) may feel different in voice from the heavily rewritten ones (Delivery, People Fundamentals). Worth a read-through to close the gap.

### 4.3 Callout usage audit
**What:** After the restructure, re-read every `{: .note }`, `{: .warning }`, `{: .important }`. Some may now feel overused or redundant. Cut anything that isn't pulling its weight.

### 4.4 Link audit
**What:** Every external link to a book, article, or tool. Several will have rotted. Check and replace. `references.md` is where most of these live.

---

## 5. Nice-to-have — not required for publication

- **PDF export** — the print CSS is in place, but a one-click "Download PDF" link on the landing page would be a nice touch. Could be generated via Jekyll plugin or a GitHub Action that runs Puppeteer.
- **Search improvements** — just-the-docs search works, but ranking could be tuned.
- **Analytics** — Google Analytics slot is in `_config.yml`, commented out. Decide whether to enable.
- **Versioning** — once published, a way to mark this as "1st edition" and plan a v1.1 for Remote/Managing Managers content.
- **A landing-page "Start here" CTA** — a single button that points to "First 90 Days" for new managers, prominent on the home page.

---

## Suggested session plan

**Session 1 (content):** Items 1.1, 1.2, 1.3 — Marco drafts war stories as rough bullets, Claude edits them in.

**Session 2 (layout):** Items 3.1, 3.2, 3.3 — all mechanical; doable in one working session.

**Session 3 (polish):** Items 4.1 through 4.4 — full copyedit pass, callout audit, link audit.

**Session 4 (v1.1 content):** Items 2.1, 2.2 — Remote/Hybrid chapter and Managing Managers appendix. Can be published as a v1.1 update after the initial book is out.
