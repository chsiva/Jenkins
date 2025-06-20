Jenkins > Declarative pipeline with using shared libraries

| **Stage**                | **Python App**                                                              | **Java App**                         | **Node.js App**                                       |
| ------------------------ | --------------------------------------------------------------------------- | ------------------------------------ | ----------------------------------------------------- |
| **Code Checkout**        | `git checkout`                                                              | `git checkout`                       | `git checkout`                                        |
| **Dependency Install**   | Not always required (simple apps) <br> or `pip install -r requirements.txt` | `mvn clean install` or `mvn package` | `npm install`                                         |
| **Build Step**           | ❌ No build step (interpreted)                                               | ✅ Compile source via Maven           | ❌ No build step unless using TypeScript               |
| **Unit Testing**         | ✅ `pytest`                                                                  | ✅ `mvn test`                         | ✅ `cucumber`, or other test runners (`jest`, `mocha`) |
| **Code Coverage**        | Optional (`pytest-cov`)                                                     | ✅ `JaCoCo` integrated with Maven     | Optional (e.g., `nyc` with `mocha`)                   |
| **Static Code Analysis** | ✅ `SonarQube`                                                               | ✅ `SonarQube`                        | ✅ `SonarQube`                                         |
| **Security Scanning**    | ✅ `Nexus IQ` <br> ✅ `Checkmarx`                                             | ✅ `Nexus IQ` <br> ✅ `Checkmarx`      | ✅ `Nexus IQ` <br> ✅ `Checkmarx`                       |
| **Test Reporting**       | `pytest` with JUnit XML output                                              | JUnit/TestNG reports                 | Cucumber reports (HTML, JSON, JUnit)                  |
| **Packaging**            | Optional (Docker image, zip, etc.)                                          | JAR/WAR via Maven                    | Optional (Docker image or zip)                        |
| **Deployment**           | Manual or automated                                                         | Manual or automated                  | Manual or automated                                   |


| Feature / Aspect             | **Nexus IQ (NXIQ)**                                                                | **Twistlock (Prisma Cloud)**                                     |
| ---------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
  **Supported Platforms**      | Any language with dependencies (Java, Python, Node, etc.)                          | Containers, Kubernetes, cloud infrastructure                     |
| **Primary Focus**            | Software Composition Analysis (SCA)                                                | Container & Cloud Native Security                                |
| **Scan Target**              | Source code dependencies (libraries/packages)                                      | Container images, hosts, serverless, Kubernetes                  |
| **Scope**                    | Open-source vulnerabilities in application dependencies (Java, Python, Node, etc.) | Vulnerabilities in container images, runtime threats, compliance |
| **Type of Scanning**         | Static analysis of dependencies & licenses                                         | Image static scan + runtime protection + compliance              |
| **Integration Level**        | IDE, CI/CD pipeline (via CLI or plugins)                                           | CI/CD pipeline, container registries, runtime agents             |
| **Container Image Scanning** | Limited or indirect (via dependency scanning)                                      | Full container image scanning (OS + app layers)                  |
| **Runtime Security**         | No                                                                                 | Yes — protects running containers & hosts                        |
| **Policy Management**        | License, security policy enforcement                                               | Security, compliance, runtime policy enforcement                 |
| **Vulnerability Sources**    | CVE databases + proprietary Nexus Intelligence                                     | CVE databases + runtime threat intelligence                      |
| **Licensing Check**          | Yes                                                                                | No                                                               |
| **Typical Users**            | Developers, security teams focusing on dependency risks                            | DevOps, SecOps teams managing container/cloud security           |
| **Fail Build on Violation**  | Yes, based on policy setup                                                         | Yes, based on vulnerability or compliance rules                  |

# Veracode scan vs other
Veracode is a full-stack application security platform combining SAST, DAST, and SCA, mostly SaaS-based and focused on enterprise security.


Checkmarx specializes in SAST, excellent for deep source code security analysis.


SonarQube is primarily for code quality, but includes some static security analysis features.


Nexus IQ focuses on open-source dependency security and license compliance.


They are often used together in mature pipelines to cover code quality, security, and open-source risks comprehensively.


# Jenkins (CI/CD)
So, whenever I wanted to make some changes to the existing code and then I wanted to push it. Like I want to deploy to the relavant environment (dev). What I do is like I come into my IDE.Or like whatever application we used and once the code is pushed then we raise a merge request where a dev will be reviewing it and  So once I get an approval from developer the for the merge request and the merge is done. It gets into the development branch, if we wanted to deploy to the production environment on the master, again we need to request a merge in publishing to master (prod). Once it merged the Jenkins pipeline will be triggered. 

So Once merge is done, CI CD process starts off. And when the CICD process Kicked off, about what we're doing. Once it goes into Packer golden entity called an ami that kicks off. we have setup what this process need to be done. Let say then one set of the packer golden ami images process kicks off. So once this process is triggered and it continues. The Second Step is like we have attached to the docker containers. So once the ami image is done, these artifacts will be store into the docker registry. Once it stored then it starts getting into CD deployment. 

When it's time to deployment it uses the repository code to delpoy it into the relevant environment. And then all metadata programs or like bootstrappingsteps will be carried out.  After the process is completed, kicks off a notification saying that you're build is done and your infrastructure is deployed. Finally, we can go the relevant environment and see the application

// Jenkinsfile (Declarative Pipeline)
pipeline {
  agent any
  stages {
    stage('Stage 1') {
      steps {
        echo 'Hello world!'
      }
    }
  }
}

# jenkins plugins used.
SCM Plugin (GITHUb), Folders, metrics, kubentes, ECS, pipeline, performance, Junit and much more.

# jenkins security

Using role based acess is good. This is configured on the top level based. Lets say like developer or normal user based group. These group will be linked to the Active Directory behind the seen. And one a sailpoint request is raised and approved then the relevant group will get aprropriate permissions.

There is a Role based automation plugin for jenkins. where we can create and assign the privilages to the users/group

With Azure active directory.

# jenkins issues


# jenkins version

Go to your /var/lib/jenkins/ there will be a file called config.xml

View that file cat config.xml and there should be a xml entry called:

<version>YourVersionNumber</version>

# What is a Jenkinsfile?
Jenkins pipelines can be defined using a text file called Jenkinsfile. You can implement pipeline as code using Jenkinsfile, and this can be defined by using a domain-specific language (DSL). With Jenkinsfile, you can write the steps needed for running a Jenkins pipeline.

# CI CD process

Step1: Code -> integrate with github (commits are pushed)  
Step 2: Continous integration -> biuld -> test junit/selinium (notify test results) --> white source (seccurity)
Step3: Continous Deployment -> dev, QA, Stage, prod

# WhiteSource 
identifies every open source component in your software, including dependencies. It then secures you from vulnerabilities and enforces license policies throughout the software development lifecycle.

Pipeline Support
Jenkins version 2. x or later.
Pipeline plugin installed.
WhiteSource plugin version 1.8. x or later.

# Pipeline
A Pipeline is a user-defined model of a CD pipeline. A Pipeline’s code defines your entire build process, which typically includes stages for building an application, testing it and then delivering it.

Also, a pipeline block is a key part of Declarative Pipeline syntax.

# Node
A node is a machine which is part of the Jenkins environment and is capable of executing a Pipeline.

Also, a node block is a key part of Scripted Pipeline syntax.

# Stage
A stage block defines a conceptually distinct subset of tasks performed through the entire Pipeline (e.g. "Build", "Test" and "Deploy" stages), which is used by many plugins to visualize or present Jenkins Pipeline status/progress. [6]

# Step
A single task. Fundamentally, a step tells Jenkins what to do at a particular point in time (or "step" in the process). For example, to execute the shell command make use the sh step: sh 'make'. When a plugin extends the Pipeline DSL, [1] that typically means the plugin has implemented a new step.



# scripted vs Declarative pipelines

The key difference between Declarative pipeline and Scripted pipeline would be with respect to their syntaxes and their flexibility. 

Declarative pipeline is a relatively new feature that supports the pipeline as code concept. It makes the pipeline code easier to read and write. This code is written in a Jenkinsfile which can be checked into a source control management system such as Git.

Whereas, the scripted pipeline is a traditional way of writing the code. In this pipeline, the Jenkinsfile is written on the Jenkins UI instance. 

Though both these pipelines are based on the groovy DSL, the scripted pipeline uses stricter groovy based syntaxes because it was the first pipeline to be built on the groovy foundation. Since this Groovy script was not typically desirable to all the users, the declarative pipeline was introduced to offer a simpler and more optioned Groovy syntax.

# How Does a Multi-Branch Pipeline work?

I will walk you through a basic build and deployment workflow to understand how a multi-branch pipeline work.

Let’s say I want a Jenkins pipeline to build and deploy an application with the following conditions.

Development starts with a feature branch by developers committing code to the feature branch. 
Whenever a developer raises a PR from the feature branch to develop a branch, a Jenkins pipeline should trigger to run a unit test and static code analysis. 
After testing the code successfully in the feature branch, the developer merges the PR to the develop branch.
When the code is ready for release, developers raise a PR from the develop branch to the master. It should trigger a build pipeline that will run the unit test cases, code analysis, push artifact, and deploys it to dev/QA environments.


# Introduction to Declarative Pipelines

## https://github.com/cloudbees/intro-to-declarative-pipeline

This repository contains the instructions and learning materials associated with a hands on training workshop called **Introduction to Declarative Pipelines** that is designed to teach the following key concepts:

  * What are Jenkins Pipelines and why should you use them?
  * Why should you use [Declarative](https://jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline) vs [Scripted](https://jenkins.io/doc/book/pipeline/syntax/#scripted-pipeline) pipelines?
  * What tools are available for creating pipelines?
  * How can you create a simple pipeline via Jenkins?
  * What are the key features of Declarative pipelines?
  * How do you create multibranch pipelinest?
  * How do you  create a pipeline using Blue Ocean's pipeline editor?
  * What are Distributed Pipelines - an architecture that distributes your Pipelines by providing per team Jenkins Masters
  * CloudBees Pipeline features that enable and enhance **Distributed Pipelines**
  
A PDF version of the presentation that accompanies this workshop can be found here: [Introduction%20to%20Declarative%20Pipeline%20-%20Hands%20On.pdf](Introduction%20to%20Declarative%20Pipeline%20-%20Hands%20On.pdf)

[**Set-up Instructions**](Setup.md)

**The exercises covered in the workshop are available at the following links:**

  * **Declarative Syntax Basics**: [Exercise-01.md](Exercise-01.md)
  * **Declarative Advanced Syntax**: [Exercise-02.md](Exercise-02.md)
  * **Distributed Pipelines with CloudBees**: [Exercise-03.md](Exercise-03.md)
  * **Distributed Pipelines with Pipeline As Code**: [Exercise-04.md](Exercise-04.md)

**Important Note**: The training content contained in this workshop is kept up to date with the latest releases of pipeline plugins and not all features will be available in Jenkins environments that are not updated regulary or within CAP (the CloudBees Assurance Program). The following are the currently required Pipeline plugin versions:

 -  **pipeline-model-definition** ***1.2.6***

# Training Prerequisites

In order to follow along with the hands on portion of the workshop students should have the following resources available to them:

  * Internet access
  * An account on Github.com and a basic understanding of how to use Github to do things like fork a repository, edit files in the web UI, and create pull requests
  * A personal access token for your Github account ([Github-Personal-Access-Token.md](Github-Personal-Access-Token.md)) with the following permissions:
    - repo: all
    - admin:repo_hook: all
    - admin:org_hook
    - user: all
  * Access to a Jenkins server
  
Detailed set-up instructions are available at **[Setup](Setup.md)**

# Revision History

 See: [Releases](https://github.com/PipelineHandsOn/intro-to-declarative-pipeline/releases)

# License

The content in this repository (with the important exception of the PDF, see note below) is Open Source material released under the Apache 2.0 License. Please see the [LICENSE](LICENSE) file for full license details.

**Important Note**: The ```Introduction to Declarative Pipeline - Hands On.pdf``` file contains corporate identify materials that are proprietary to CloudBees, Inc. that cannot be reused without written permission from CloudBees, Inc. 

# Disclaimer

Although the code in this repository was originally created by employees of CloudBees, Inc. to use in training customers your use of this material is not sponsored or supported by CloudBees, Inc.

# Contributors 

* Contributor: [Kurt Madel](https://github.com/kmadel)
* Contributor: [Brent McConnell](https://github.com/brentmcconnell)
 
# Questions, Feedback, Pull Requests Etc.

If you have any questions, feedback, suggestions, etc. please submit them via issues or, even better, submit a Pull Request!
 
