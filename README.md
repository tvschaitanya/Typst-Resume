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

Bullets support inline Typst markup:

| Syntax | Output |
|---|---|
| `*bold text*` | **bold text** |
| `_italic text_` | _italic text_ |
| `#link("https://example.com")[label]` | clickable hyperlink |
| `*bold* and _italic_ mixed` | mix freely |

Example:

```typst
bullets: (
  "Reduced latency by *40%* through query optimization",
  "Open-sourced at #link(\"https://github.com/you/project\")[github.com/you/project]",
),
```

Leave bullets empty with `bullets: ()` to render the entry with no bullet points.

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

The `degree` field supports inline Typst markup (same rules as bullets above). `bullets: ()` is valid — it just renders nothing below the degree line.

---

#### Certifications

```typst
#let certifications = (
  (name: "AWS Certified Solutions Architect"),
  (name: "Certified Kubernetes Administrator (CKA)"),
)
```

---

### 3. Hiding Sections

Any section whose data is empty is automatically hidden — no extra config needed:

```typst
#let certifications = ()   // section won't appear at all
#let summary = ""          // summary section won't appear
```

This works for all sections: `skills`, `work-experience`, `projects`, `education`, `certifications`.

---

### 4. Control Section Order — `main.typ`

At the top of `main.typ`, reorder, comment out, or remove entries to control what appears and where:

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

Valid section names: `"summary"`, `"skills"`, `"experience"`, `"projects"`, `"education"`, `"certifications"`. Unknown names are silently ignored.

---

### 5. Theme Options — `main.typ`

The `#show: resume.with(...)` block at the top of `main.typ` controls the visual style:

```typst
#show: resume.with(
  author:                  name,
  location:                maybe(location),
  email:                   maybe(email),
  github:                  maybe(github),
  linkedin:                maybe(linkedin),
  phone:                   maybe(phone),
  personal-site:           maybe(personal-site),
  accent-color:            "#000000",   // hex color for section headings
  font:                    "Times New Roman",
  paper:                   "us-letter", // or "a4"
  author-position:         center,      // left, center, or right
  personal-info-position:  center,      // left, center, or right
)
```

Common tweaks:

| Field | Example values |
|---|---|
| `accent-color` | `"#000000"` (black), `"#2563eb"` (blue), `"#16a34a"` (green) |
| `font` | `"Times New Roman"`, `"Arial"`, `"Libertinus Serif"` |
| `paper` | `"us-letter"` (default), `"a4"` |
| `author-position` | `left`, `center`, `right` |

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

Output is saved to `exports/Resume_<Initials>_<target-role>.pdf`, named automatically from your name in `contact.typ` and `target-role` in `data.typ`. For example, Jane Smith targeting "Senior Software Engineer" produces `exports/Resume_JS_senior_software_engineer.pdf`. If a file with that name already exists, it appends a number (`-1`, `-2`, etc.) rather than overwriting.

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
