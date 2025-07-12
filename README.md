
# 🚀 GitOps Docker Rollout Script

This repository contains a powerful shell script, `/build.api.rollout.sh`, designed to automate the full **GitOps lifecycle** for a Dockerized application — from building and tagging images, to pushing and deploying to staging or production environments.

---

## 📦 Purpose

This script streamlines DevOps workflows for applications using **Docker**, **GCP Container Registry (GCR)**, and **custom build IDs**. It supports dynamic targeting of staging or production environments, and includes build, push, and optional cleanup operations.

---

## 🧠 Features

- 🔧 Customizable build arguments (e.g. `APP_BUILD_ID`, `VERSION`)
- 🐳 Docker image building (with `Dockerfile` or `Dockerfile.base`)
- ☁️ Push images to **GCR**
- 🚀 Deploy to **staging** or **production**
- 🧹 Option to remove all related images locally

---

## 📁 Script Location

```bash
/build.api.rollout.sh
````

---

## 💻 Usage

Make the script executable:

```bash
chmod +x build.api.rollout.sh
```

Then run with desired options:

```bash
./build.api.rollout.sh [COMMANDS...]
```

### 🔧 Example: Build & Deploy to Staging

```bash
./build.api.rollout.sh staging build push deploy
```

### 🔐 Example: Deploy to Production

```bash
./build.api.rollout.sh prod build push deploy
```

### 🧹 Example: Clean local Docker images

```bash
./build.api.rollout.sh removeall
```

---

## 🧾 Available Commands

| Command      | Description                                                                      |
| ------------ | -------------------------------------------------------------------------------- |
| `staging`    | Target the **staging** environment. Uses GCR project: `zmooz-dev`                |
| `prod`       | Target the **production** environment. Uses GCR project: `glossy-essence-248121` |
| `build-base` | Build image using `Dockerfile.base` with no cache                                |
| `build`      | Build image using main `Dockerfile`, includes `APP_BUILD_ID`                     |
| `push`       | Push built image to GCR                                                          |
| `deploy`     | Deploy to the selected environment (stub placeholder)                            |
| `removeall`  | Delete all local Docker images matching the selected GCP project                 |

---

## 🧬 Environment Variables

| Variable       | Description                                                |
| -------------- | ---------------------------------------------------------- |
| `VERSION`      | Docker tag version (`1.0.x` for staging, `2.0.x` for prod) |
| `REPOSITORY`   | Docker repository URL                                      |
| `IMAGE_TAG`    | Full image reference to push/build                         |
| `APP_BUILD_ID` | Build identifier for CI/CD versioning                      |
| `PROJECTID`    | GCP project ID used for GCR                                |

---

## 📌 Requirements

* Docker installed and authenticated
* Access to relevant GCP projects (`docker login`, `gcloud auth configure-docker`)
* Proper Dockerfiles present:

  * `Dockerfile`
  * `Dockerfile.base` (optional)

---

## 📄 License

MIT — Feel free to use and modify.

---
