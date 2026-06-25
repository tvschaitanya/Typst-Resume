// ── Application Target ────────────────────────────────────────────────────────
// Not rendered — for your reference only

#let target-company = "Anthropic"
#let target-role    = "Senior Machine Learning Engineer"
#let target-job-id  = "JOB-12345"


// ── Summary ───────────────────────────────────────────────────────────────────
// Set to "" to omit the section

#let summary = "Software engineer with 4+ years of experience building and deploying cloud-native applications and machine learning pipelines. Skilled in designing scalable distributed systems on AWS and GCP, fine-tuning large language models, and delivering production-grade APIs. Strong background in MLOps, infrastructure-as-code, and cross-functional collaboration."


// ── Skills ────────────────────────────────────────────────────────────────────
// Each entry: label (bolded) + comma-separated items string

#let skills = (
  (label: "Languages",      items: "Python, TypeScript, Go, SQL, Bash, YAML"),
  (label: "AI & ML",        items: "PyTorch, TensorFlow, Hugging Face Transformers, LangChain, OpenAI API, scikit-learn, Pandas, NumPy"),
  (label: "Cloud & DevOps", items: "AWS (EC2, S3, Lambda, SageMaker), GCP (Vertex AI, BigQuery, Cloud Run), Docker, Kubernetes, Terraform, CI/CD, GitHub Actions"),
)


// ── Experience ────────────────────────────────────────────────────────────────
// Set company or location to "" to omit them

#let work-experience = (
  (
    title:    "Senior Machine Learning Engineer",
    company:  "Cloudware AI",
    location: "San Francisco, CA",
    start:    "Jun 2023",
    end:      "Present",
    bullets: (
      "Designed and deployed a RAG-based document intelligence platform on AWS using LangChain, FAISS, and GPT-4, reducing manual document review time by 70%",
      "Built and maintained MLOps pipelines on SageMaker for model training, evaluation, and A/B deployment across 12 production models serving 5M+ daily requests",
      "Led migration of monolithic inference service to containerized microservices on EKS, improving p99 latency by 40% and cutting infrastructure costs by 30%",
      "Mentored 3 junior engineers on LLM fine-tuning workflows and cloud cost optimization best practices",
    ),
  ),
  (
    title:    "Machine Learning Engineer",
    company:  "DataBridge Corp",
    location: "Austin, TX",
    start:    "Aug 2021",
    end:      "May 2023",
    bullets: (
      "Fine-tuned open-source LLMs (LLaMA 2, Mistral) using LoRA and PEFT on GCP Vertex AI for domain-specific NLP tasks, achieving 18% improvement over baseline",
      "Developed real-time anomaly detection system using streaming data from Pub/Sub and BigQuery ML, reducing incident response time by 55%",
      "Automated model retraining and monitoring pipelines with Airflow and Terraform, eliminating 15+ hours of manual ops work per week",
      "Collaborated with product and data teams to define ML feature roadmap and translate business requirements into model specifications",
    ),
  ),
  (
    title:    "Cloud Infrastructure Engineer",
    company:  "NexGen Systems",
    location: "Seattle, WA",
    start:    "May 2020",
    end:      "Jul 2021",
    bullets: (
      "Provisioned and managed multi-region AWS infrastructure using Terraform and CloudFormation for a SaaS platform serving 200K users",
      "Implemented CI/CD pipelines with GitHub Actions and AWS CodePipeline, reducing deployment cycle from 2 days to under 2 hours",
      "Optimized cloud spend by 35% through reserved instance planning, S3 lifecycle policies, and right-sizing of EC2 workloads",
    ),
  ),
)


// ── Projects ──────────────────────────────────────────────────────────────────
// Set role or url to "" to omit them

#let projects = (
  (
    name:  "OpenInfer",
    role:  "Creator & Maintainer",
    start: "Jan 2024",
    end:   "Present",
    url:   "openinfer.dev",
    bullets: (
      "Open-source LLM inference server built with Python and FastAPI, supporting OpenAI-compatible endpoints for self-hosted models with 1.2K+ GitHub stars",
      "Implemented dynamic batching, quantization (GPTQ, AWQ), and multi-GPU support, achieving 3x throughput vs naive serving baseline",
      "Deployed reference infrastructure on AWS with Terraform and Docker; full observability via Prometheus and Grafana dashboards",
    ),
  ),
  (
    name:  "CloudCost Analyzer",
    role:  "Lead Developer",
    start: "Sep 2023",
    end:   "Dec 2023",
    url:   "",
    bullets: (
      "Built an AI-powered AWS cost analysis tool using GPT-4 and the AWS Cost Explorer API to surface savings recommendations in plain English",
      "Reduced average cloud bill by 22% across 10 pilot teams by automating idle resource detection and right-sizing suggestions",
    ),
  ),
)


// ── Education ─────────────────────────────────────────────────────────────────
// Set degree or location to "" to omit them

#let education = (
  (
    institution: "University of California, San Diego",
    location:    "San Diego, CA",
    start:       "Sep 2020",
    end:         "Jun 2022",
    degree:      "Master of Science, Computer Science — GPA: 4.0",
    bullets:     (),
  ),
  (
    institution: "University of California, San Diego",
    location:    "San Diego, CA",
    start:       "Sep 2016",
    end:         "Jun 2020",
    degree:      "Bachelor of Science, Computer Science",
    bullets:     (),
  ),
)


// ── Certifications ────────────────────────────────────────────────────────────

#let certifications = (
  (name: "AWS Certified Machine Learning – Specialty"),
  (name: "Google Professional Machine Learning Engineer"),
  (name: "AWS Certified Solutions Architect – Associate"),
  (name: "Certified Kubernetes Administrator (CKA)"),
)