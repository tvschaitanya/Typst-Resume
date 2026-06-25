# Typst Resume

A data-driven resume built with [Typst](https://typst.app) using the [`basic-resume`](https://typst.app/universe/package/basic-resume) package. Content lives in two plain `.typ` files — you never touch the layout.

---

## How it works

| File | Purpose |
|---|---|
| `contact.typ` | Your personal info (name, email, links) |
| `data.typ` | All resume content + the job you're targeting |
| `main.typ` | Layout engine — edit only for cosmetic changes |
| `quick-save.sh` | Build script that compiles and names the PDF automatically |

The output PDF is named from your initials and the target role, e.g. `Resume_JD_senior_machine_learning_engineer.pdf`, and placed in `exports/`.

---

## Requirements

- Typst installed and on your `PATH` (see below)
- Bash (macOS/Linux or WSL on Windows)

## Installing Typst

**macOS**
```bash
brew install typst
```

**Other platforms** — pre-built binaries, Windows (`winget`), Linux package managers, Cargo, Nix, and Docker:
[github.com/typst/typst#installation](https://github.com/typst/typst#installation)

---

## Usage

```bash
# Compile once
./quick-save.sh

# Watch mode (recompiles on save)
./quick-save.sh watch

# Clear exports/ before compiling
./quick-save.sh -c
```

If a file with the same name already exists, the script appends a timestamp instead of overwriting it.

---

## Editing your content

### `contact.typ` — Personal info

Set any field to `""` to hide it from the header.

```typst
#let name          = "Jane Smith"
#let location      = "New York, NY"
#let email         = "jane@example.com"
#let phone         = "+1 (555) 000-0000"
#let github        = "github.com/janesmith"
#let linkedin      = "linkedin.com/in/janesmith"
#let personal-site = ""   // hidden — field is empty
```

### `data.typ` — Resume content

**Target job** (not rendered, just drives the output filename):
```typst
#let target-company = "Acme Corp"
#let target-role    = "Software Engineer"
#let target-job-id  = "JOB-001"
```

**Summary** — set to `""` to omit the section entirely:
```typst
#let summary = "Your summary here."
```

**Skills** — each entry has a bolded `label` and a comma-separated `items` string:
```typst
#let skills = (
  (label: "Languages", items: "Python, Go, TypeScript"),
  (label: "Cloud",     items: "AWS, GCP, Terraform"),
)
```

**Work experience** — `company` and `location` can be `""` to hide them:
```typst
#let work-experience = (
  (
    title:    "Senior Engineer",
    company:  "Acme Corp",
    location: "Remote",
    start:    "Jan 2022",
    end:      "Present",
    bullets: (
      "Built X, which improved Y by Z%",
    ),
  ),
)
```

**Projects** — `role` and `url` can be `""` to hide them:
```typst
#let projects = (
  (
    name:  "My Project",
    role:  "Creator",
    start: "Mar 2024",
    end:   "Present",
    url:   "myproject.dev",
    bullets: (
      "What it does and why it matters",
    ),
  ),
)
```

**Education** — `degree` and `location` can be `""` to hide them. Add bullets if you want to list coursework or honors, or leave `bullets: ()` for a clean two-liner:
```typst
#let education = (
  (
    institution: "State University",
    location:    "Austin, TX",
    start:       "Sep 2018",
    end:         "May 2022",
    degree:      "B.S. Computer Science",
    bullets:     (),
  ),
)
```

**Certifications** — a flat list of names:
```typst
#let certifications = (
  (name: "AWS Certified Solutions Architect"),
)
```

---

## Controlling section order

In `main.typ`, reorder, comment out, or remove entries in `section-order`:

```typst
#let section-order = (
  "summary",
  "skills",
  "experience",
  "projects",
  "education",
  "certifications",
)
```

Any section with no content is automatically skipped, so you can also just leave its data empty.

---

## Cosmetic settings

These live at the top of `main.typ` inside the `#show: resume.with(...)` block:

| Setting | Default | Notes |
|---|---|---|
| `accent-color` | `"#000000"` | Hex color for section headings |
| `font` | `"Times New Roman"` | Any font Typst can find |
| `paper` | `"us-letter"` | `"a4"` for international use |
| `author-position` | `center` | `left` or `right` also valid |
| `personal-info-position` | `center` | Same options as above |