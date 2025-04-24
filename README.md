# SDA-bootcamp-project ☁ 
<details>
  <summary>  Stage 1   </summary>
 
  ## Stage 1 - Basic Chatbot

A basic chatbot using streamlit and openai api.

Store your `OPENAI_API_KEY` in `.env` file. Run

```
streamlit run chatbot.py
```
to run the app
</details>
<details>
  <summary>  Stage 2  </summary>
  
## Stage 2 - Basic Chatbot with FastAPI

### Stage Introduction

In this stage, we enhance our basic chatbot by **introducing FastAPI** as a backend service. Instead of making direct calls to the **OpenAI API** from the frontend, we now handle these requests through the FastAPI backend.


<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/stage-2.png" alt="" ><figure>

  
With this setup, when a user interacts with the **Streamlit frontend**, their request is sent to the **FastAPI backend**, which then calls the **OpenAI API** and returns the response.

By **separating responsibilities**, the frontend focuses on **user interaction and session management**, while the backend handles **business logic and API calls**. This modular approach ensures that as long as the backend is running, the frontend can be replaced or updated with another technology **without affecting core functionality**.

---

### How to Get Started

### **Step 1: Set Up Environment Variables**

Store your **OpenAI API key** in a `.env` file:

`OPENAI_API_KEY=YOUR-OPENAI-API-KEY`

### **Step 2: Start the Backend**

Before running the chatbot, start the **FastAPI** backend:

`uvicorn backend:app --reload`

### **Step 3: Start the Frontend**

Once the backend is running, launch the **Streamlit** app with:

`streamlit run chatbot.py`

> Note: Always start the backend first to ensure the chatbot functions properly.
</details>

<details>
   <summary>  Stage 3   </summary>
  
## Stage 3 - Chatbot with Chat History

### Stage Introduction

In this stage, we enhance our basic chatbot, built with **Streamlit and FastAPI**, by adding **chat history storage**. Now, conversations are saved locally, and session details are logged in a **PostgreSQL database**, allowing users to continue their chats seamlessly.

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/stage-3.png" alt="" ><figure>

Specifically, we store the **chat ID, chat name, and file path** of each conversation in PostgreSQL. Whenever the chatbot is reopened, it automatically retrieves the previous chat history, providing a smoother user experience.

By **separating responsibilities**—Streamlit for the frontend, FastAPI for backend logic, and PostgreSQL for data storage—we ensure a **flexible and maintainable** architecture. Each component can be updated or replaced independently, making it easier to extend functionality without affecting the overall system. Additionally, this structure lays the foundation for a smooth transition to **cloud deployment** in future stages.

---

### How to Get Started

In this stage, we create a **new table** called `chats` in PostgreSQL to store chat history. Use the following schema:

`CREATE TABLE IF NOT EXISTS chats (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    file_path TEXT NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);`

### **Step 1: Configure Environment Variables**

Store your **OpenAI API key** and **database credentials** in a `.env` file.

Your `.env` file should look like this:

`OPENAI_API_KEY=YOUR-OPENAI-API-KEY
DB_NAME=YOUR-DB-NAME
DB_USER=YOUR-DB-USER
DB_PASSWORD=YOUR-DB-PASSWORD
DB_HOST=YOUR-DB-HOST
DB_PORT=YOUR-DB-PORT`

### **Step 2: Start the Backend**

Before running the chatbot, start the FastAPI backend using:

`uvicorn backend:app --reload`

### **Step 3: Start the Frontend**

Once the backend is running, launch the Streamlit app with:

`streamlit run chatbot.py`

> Note: Always start the backend first to ensure proper communication between components.
</details>

<details>
  <summary>  Stage 4  </summary>
  
## Stage 4 - RAG Chatbot with Chat History

### Stage Introduction

A **RAG (Retrieval-Augmented Generation) chatbot** using Streamlit and FastAPI. At this stage, we introduce the ability for users to upload PDF files in addition to regular chatting. This allows them to ask questions specifically about the content of those documents.


<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/stage1-4.png" alt="" ><figure>

Under the hood, the system uses a **vector store (Chroma)** to retrieve the most relevant context from uploaded PDFs. This retrieval step enhances the chatbot’s ability to provide accurate, context-aware answers, bridging the gap between simple conversation and document-focused queries.

This enhancement integrates seamlessly with our existing setup—Streamlit for the user interface, FastAPI for business logic, and PostgreSQL for data storage—while laying the foundation for further expansion.

> Note: Some LLM-related concepts introduced in this stage may seem complex. However, our main goal is to get the project running, and fully understanding the LLM integration is optional. If you’re interested, feel free to explore the code and additional resources to enhance your project, but don’t worry if you don’t grasp everything right away.
> 

---

### How to Get Started

In this stage, we will create a **new** table called `advanced_chats` in the database using the following schema:

`CREATE TABLE IF NOT EXISTS advanced_chats (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    file_path TEXT NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pdf_path TEXT,
    pdf_name TEXT,
    pdf_uuid TEXT
);`

Alternatively, you can **add the extra columns** to the `chats` table created in Stage 3 instead of creating a new table.

### **Step 1: Set Up Environment Variables**

Store your `OPENAI_API_KEY` and **Database Credentials** in a `.env` file.

Your `.env` file should look like this:

`OPENAI_API_KEY=YOUR-OPENAI-API-KEY
DB_NAME=YOUR-DB-NAME
DB_USER=YOUR-DB-USER
DB_PASSWORD=YOUR-DB-PASSWORD
DB_HOST=YOUR-DB-HOST
DB_PORT=YOUR-DB-PORT`

### **Step 2: Install Dependencies**

To use **ChromaDB**, install it via `pip`. The necessary packages are listed in `requirements.txt`, so you can install everything by running:

`pip install -r requirements.txt`

### **Step 3: Start ChromaDB**

To enable retrieval, we need to start ChromaDB. Use the following command to start the Chroma server:

`chroma run --path /db_path`

Replace `/db_path` with the directory where you want to store the data, e.g., `chromadb`.

### **Step 4: Start the Backend**

Next, start the FastAPI backend:

`uvicorn backend:app --reload --port 5000`

> Note: Compared to the last stage, we have added the --port 5000 parameter. Since ChromaDB uses port 8000 by default, this prevents a port conflict.
> 

### **Step 5: Start the Streamlit App**

Finally, run the Streamlit app:

`streamlit run chatbot.py`
</details>

<details>
  <summary>  Stage 5  </summary>
  
  ## Project Stage 5: Moving to Azure VM Manually

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week3-stage5.png" alt="" ><figure>

At this stage, we will move our application to an Azure VM. We’ll create a new VM and deploy our databases, frontend, and backend services on it. Additionally, we will manually set up the following components: an Azure network security group, an Azure Virtual Network, a public IP address, a subnet, a disk, and a network interface. Note that we will not use Infrastructure as Code (IaC) at this stage; everything will be set up manually.

VM Specifications:

- Operating System: ubuntu-24_04-lts
- Instance Type: `Standard_D2ads_v6` or similar
- Disk Size: 30GB

Furthermore, systemd service files should be created for the databases, frontend, and backend services. These services should be enabled and started.

In the end, you should be able to access the application via the public IP address of the VM
</details>

<details>
  <summary>  Stage 6   </summary>

## Project Stage 6: Postgres and Blob Storage on Azure
<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week3-stage6.png" alt="" ><figure>

Based on Stage 5, we are adding two new resources to the infrastructure: an Azure Database for PostgreSQL server and Azure Blob Storage. Instead of running PostgreSQL on the VM, we’ll use the Azure Database for PostgreSQL server for data storage, and files will be stored in Azure Blob Storage.

### VM Specifications:

Operating System: ubuntu-24_04-lts
Instance Type: Standard_D2ads_v6 or similar
Disk Size: 30GB
PostgreSQL Database Specifications:

Public Access: Enabled
Workload Type: Development
Authentication Method: PostgreSQL authentication only
Firewall Rules: 0.0.0.0 - 255.255.255.255
A custom VM script should be created to:

Pull the latest code from the GitHub repository,
Install the required packages, and
Restart the frontend and backend services.
.env file in your VM
OPENAI_API_KEY=sk-...
DB_NAME=<azure postgres database name>
DB_USER=<azure postgres user name>
DB_PASSWORD=<azure postgres user password>
DB_HOST=<azure postgres server name>
DB_PORT=5432
AZURE_STORAGE_SAS_URL=...
AZURE_STORAGE_CONTAINER=...
CHROMADB_HOST=<public ip of the chromadb vm>
CHROMADB_PORT=8000
Additionally, systemd service files should be created for the frontend, and backend services. These services must be enabled and started.

GitHub Actions will be used as the CI/CD pipeline to trigger the VM custom script, ensuring that the VM automatically updates whenever a new commit is made.

In the end, you should be able to access the application via the VM’s public IP address, with data stored in the Azure Database for PostgreSQL server and files stored in Azure Blob Storage.
    </details>


<details>
  <summary>  Stage 6.1   </summary>
  
 ## Project Stage 6.1: Application Gateway and VMSS on Azure
<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week6-stage7.png" alt="" ><figure>
Based on Stage 6, we are adding two new resources to the infrastructure: an Azure Application Gateway and a Virtual Machine Scale Set (VMSS). The Azure Application Gateway will redirect traffic to the VMSS, which will host our application.

At stage, the VM is only used for deploying ChromaDB.

The frontend and backend services will be deployed on the VMSS. In order to do this, we need to create a new image from a VM and use it to create a VMSS. The VM will be deleted, but the image will be kept. This image should have the frontend and backend services set up and running.

### VMSS Specifications:

Source Image: The image created from the VM
Instance Type: Standard_D2ads_v6 or similar
Upgrade Mode: Automatic
Disk Size: 30GB
Orchestration Mode: Uniform
Scaling Mode: Autoscaling
Scaling Condition:
Increase count: (2, 3, 2)
CPU threshold: (80%, 20%)
Schedule: No
The VMSS and the VM for ChromaDB can share a subnet, but the application gateway should be in a separate subnet. In addition, The application gateway should be associated with the VMSS backend pool and a public IP address.

The GitHub Actions workflow should be updated to deploy the frontend and backend services to the VMSS.

The other infrastructure components are the same as stage 6.

The application code is the same as stage 6.

In the end, you should be able to access the application via the Application Gateway's public IP address, with data stored in the Azure Database for PostgreSQL server and files stored in Azure Blob Storage.
</details>

<details>
  <summary>  Stage 6.5   </summary>
  
  ## Project Stage 6.5: Azure Key Vault on Azure

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week5-stage6.5.png" alt="" ><figure>
Based on Stage 6.1, we are adding Azure Key Vault to the infrastructure. The Azure Key Vault will store the secrets and environment variables for the application. The secrets and environment variables will be retrieved from the Key Vault during the application deployment process.

The other infrastructure components are the same as stage 6.1.

In the end, you should be able to access the application via the Application Gateway's public IP address, with data stored in the Azure Database for PostgreSQL server and files stored in Azure Blob Storage.
  
  </details>

<details>
  <summary>  Stage 6.6   </summary>
  
## Production and Development Environments on Azure with Terraform
<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week5-stage6.6.png" alt="" ><figure>

### Goal of This Stage:

Create two identical sets of infrastructure using Terraform—one for your production environment and one for your development environment. This can be achieved through Terraform workspaces.

By the end of this stage, you should have two identical sets of infrastructure. There is no need to set up or test the application, and CI/CD pipelines are not required in this stage.

  </details>

  
<details>
  <summary>  Stage 7   </summary>

  ## Project Stage 7: Azure Function App

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week4-stage6.1.png" alt="" ><figure>
### Goal of This Stage:

Based on Stage 6.5, we are replacing the Azure Application Gateway and VMSS with Azure Function App. The Azure Function App will host the backend of the application. The VM will be used to host the frontend and ChromaDB. At this stage, we should create and setup infrastructure in this diagram manually.

The GitHub Actions workflow should be updated to deploy the backend to the Azure Function App.

In the end, you should be able to access the application via the VM's public IP address, with data stored in the Azure Database for PostgreSQL server and files stored in Azure Blob Storage.
    </details>
    
<details>
  <summary>  Stage 8  </summary> 

## Project Stage 8: Azure Cosmos DB

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week6-stage8.png" alt="" ><figure>

### Goal of This Stage:

Based on Stage 7, we are adding an Azure Cosmos DB to the infrastructure. The Azure Cosmos DB will store the chat history of the application. At this stage, we should create and setup infrastructure in this diagram manually. The primary key of the Cosmos DB should be stored in the Key Vault.

In the end, you should be able to access the application via the VM's public IP address, with data stored in the Azure Database for PostgreSQL server, files stored in Azure Blob Storage, and chat history stored in Azure Cosmos DB.


   </details>
<details>
  <summary>  Stage 9  </summary> 
  
## Azure Container Apps

<figure><img src="https://weclouddata.s3.us-east-1.amazonaws.com/cloud/project-stages/week7-stage10.png" alt="" ><figure>

## Goal of This Stage:

Based on Stage 7, we are replacing the Azure Function App with Azure Container Apps. The Azure Container Apps will host the backend of the application. The Azure Container Registry will be used to store the backend image. At this stage, we should create and setup infrastructure in this diagram manually.

The GitHub Actions workflow should be updated to deploy the backend to the Azure Container Apps.

In the end, you should be able to access the application via the VM's public IP address, with data stored in the Azure Database for PostgreSQL server and files stored in Azure Blob Storage.

    </details>
