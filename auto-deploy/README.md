# Content Package Auto Deploy

## Overview
This tool automates the deployment of content packages from one Cortex XSOAR instance to another.
It installs content bundles (Playbooks, Integrations, Automations, Layouts, etc.), configures Integration Instances, and prepares the target Cortex XSOAR environment for use.

---
## Prerequisites
- **Cortex XSOAR Version:** 8.x  
- Both the deploying instance and the target instance must be running Cortex XSOAR 8.x.  
- Admin permissions on both instances.  

---
## Getting Started

### Installation

#### 1. Import auto-deploy-content-bundle.tar.gz as Custom Content into Cortex XSOAR.

---
### Deploy Packages to a Target Server

The built-in **Phishing Report** package is available for deployment by default.
Below are two ways to deploy it depending on whether the Core REST API instance is already configured.

---

#### Case 1: Core REST API instance for the target server is already configured

| Step | Action                                                                                                                                                                                                                               |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1    | Navigate to **Playground**                                                                                                                                                                                                           |
| 2    | Run the **Auto Deploy - Standalone** playbook in the Work Plan                                                                                                                                                                       |
| 3    | The playbook pauses at **Deployment Configuration**. Fill in: <br> - **Online Packages**: `Phishing Report` <br> - **Core REST API instance**: select the configured target <br> - **Update Installed Content Packs**: `Yes` or `No` |
| 4    | Click **Submit Answers**                                                                                                                                                                                                             |
| ⏱️   | Deployment takes \~10 minutes. Longer if updating content packs.                                                                                                                                                                     |

---

#### Case 2: Core REST API instance for the target server is not configured

| Step                 | Action                                                                                                                                                                                                                                                          |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0                    | Ensure a Core REST API instance is configured **for the local server**.          |
| 1                    | Go to **Incidents** view                                                                                                                                                                                                                                        |
| 2                    | Click **+ New Incident**                                                                                                                                                                                                                                        |
| 3                    | Choose **Auto Deploy** as Incident Type                                                                                                                                                                                                                         |
| 4                    | Enter deployment parameters:                                                                                                                                                                                                                                    |
| → Local Management   | Select Core REST API instance connected to the local server from `Auto Deploy: Local Management Core REST API Instance`                                                                                                                                                                       |
| → Deployment Package | Select `Phishing Report` from `Auto Deploy: Online Packages`                                                                                                                                                                                                    |
| → Deployment Target  | Provide: <br> - `Auto Deploy: API Auth Method` <br> - `Auto Deploy: API ID` <br> - `Auto Deploy: API Key` <br> - `Auto Deploy: Target Server URL` (e.g., `https://api-xsoar.example.local`) <br> - `Auto Deploy: Update Installed Content Packs` (`Yes` / `No`) |
| 5                    | Click **Create New Incident**                                                                                                                                                                                                                                   |
| ⏱️                   | Deployment takes \~10 minutes. Longer if updating content packs.                                                                                                                                                                                                |

---

### Final Steps After Deploying "Phishing Report"

The **Phishing Report** package requires email sender & listener integrations. Configure them manually:

1. **Mail Sender (New)\_instance\_demo**

   * Navigate to *Integrations > Instances*
   * Update with your **SMTP server**

2. **Mail Listener v2\_instance\_phishing\_report**

   * Navigate to *Integrations > Instances*
   * Update with your **IMAP4 server**

---

## License

This project is licensed under the [MIT License](LICENSE).

