# Jenkins (CI/CD)
1. Worked on Continuous Integration/ Continuous Deployment tools (Jenkins) involved in duties for auto deployment such as creating (pipeline projects, Freestyle projects), continuously (pulling code from developers, code testing, deploying, and committing changes).
2. Developed many pipelines using Jenkins such as triggering job when a new commit happens in GitHub, snapshot process and s3 buckets, deployment of the             applications into the ec2 servers using the CI/CD pipeline in Jenkins.
3. Also, deploying the jars, created by maven and pushing docker images. I used Jenkins and created pipeline to deploy on to the target node/machine.


# jenkins version

Go to your /var/lib/jenkins/ there will be a file called config.xml

View that file cat config.xml and there should be a xml entry called:

<version>YourVersionNumber</version>

# CI CD process

Step1: Code -> integrate with github (commits are pushed)  
Step 2: Continous integration -> biuld -> test junit/selinium (notify test results) -> sonarqube (artifactory)-> white source (seccurity)
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
 
