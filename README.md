# Typst Resume

A clean, minimal resume template built with [Typst](https://typst.app) and the [`basic-resume`](https://typst.app/universe/package/basic-resume) package. Fill in your info, compile, done.

---

## Project Structure

```
contact.typ   → your personal info (name, email, links)
data.typ      → resume content (summary, experience, projects, etc.)
main.typ      → layout engine — controls section order and rendering
quick-save.sh → compile script with auto-named PDF output
```

---

## How to Write Your Resume

### 1. Personal Info — `contact.typ`

> **Privacy note:** `contact.typ` contains sensitive personal information. Do not share this file with AI tools or paste its contents into any AI chat. Fill it in manually yourself.

```typst
#let name          = "Jane Smith"
#let location      = "Austin, TX"
#let email         = "jane@example.com"
#let phone         = "+1 (555) 000-0000"
#let github        = "github.com/janesmith"
#let linkedin      = "linkedin.com/in/janesmith"
#let personal-site = "janesmith.dev"
```

Set any field to `""` to hide it from the header.

---

### 2. Resume Content — `data.typ`

#### Target Job (not rendered, for your reference)

```typst
#let target-company = "Acme Corp"
#let target-role    = "Software Engineer"
#let target-job-id  = "JOB-12345"
```

The `quick-save.sh` script uses `target-role` to name your output PDF automatically.

---

#### Summary

```typst
#let summary = "Your one-paragraph pitch goes here."
```

Set to `""` to hide the section.

---

#### Skills

Each entry has a `label` and `items` string:

```typst
#let skills = (
  (label: "Languages", items: "Python, Go, TypeScript"),
  (label: "Tools",     items: "Docker, Kubernetes, Terraform"),
)
```

---

#### Work Experience

Each entry takes `title`, `company`, `location`, `start`, `end`, and a tuple of `bullets`:

```typst
#let work-experience = (
  (
    title:    "Software Engineer",
    company:  "Acme Corp",
    location: "Austin, TX",
    start:    "Jan 2022",
    end:      "Present",
    bullets: (
      "Built X which improved Y by Z%",
      "Led migration from A to B, reducing cost by $N/month",
    ),
  ),
)
```

Bullets support inline Typst markup — use `*bold*`, `_italic_`, or `#link("url")[text]`.

---

#### Projects

```typst
#let projects = (
  (
    name:  "Project Name",
    role:  "Python, AWS, React",     // shown as tech stack
    start: "Mar 2023",
    end:   "Present",
    url:   "github.com/you/project", // set to "" to hide link
    bullets: (
      "What it does and why it matters",
    ),
  ),
)
```

---

#### Education

```typst
#let education = (
  (
    institution: "State University",
    location:    "City, ST",
    start:       "Sep 2018",
    end:         "May 2022",
    degree:      "Bachelor of Science, Computer Science - *GPA*: 3.9",
    bullets:     (),
  ),
)
```

The `degree` field supports inline Typst markup.

---

#### Certifications

```typst
#let certifications = (
  (name: "AWS Certified Solutions Architect"),
  (name: "Certified Kubernetes Administrator (CKA)"),
)
```

---

### 3. Control Section Order — `main.typ`

At the top of `main.typ`, reorder, comment out, or remove sections:

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

---

## How to Run

### Prerequisites

Install Typst: https://github.com/typst/typst#installation

```bash
# macOS
brew install typst

# or via cargo
cargo install --git https://github.com/typst/typst --locked typst-cli
```

---

### Compile to PDF

```bash
./quick-save.sh
```

Output is saved to `exports/Resume_<Initials>_<target-role>.pdf` — named automatically from your `contact.typ` and `data.typ`.

---

### Watch Mode (live preview)

```bash
./quick-save.sh -w
```

Recompiles on every save. Open the output PDF in a viewer that auto-refreshes (e.g. Skim on macOS).

---

### Clear old exports first

```bash
./quick-save.sh -c
```

Deletes the `exports/` folder before compiling. Combine flags: `./quick-save.sh -c -w`.

---

## Links

- [Typst](https://typst.app) — the typesetting system this is built on
- [`basic-resume` package](https://typst.app/universe/package/basic-resume) — the resume template package used (`v0.2.9`)
- [Typst Universe](https://typst.app/universe) — browse other Typst packages
- [Typst docs](https://typst.app/docs) — language reference
