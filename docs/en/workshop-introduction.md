# Workshop Introduction

## Migrating Zava's Temperature API from Python to C\#

As part of **Zava**'s business goals, the company is expanding their cutting-edge smart fiber technology to a wider array of retail products. Zava specializes in heat-resistant materials that adapt to various climate conditions, and their current temperature/season/location API serves as a critical backend service for these innovative products.

To support this expansion and ensure enterprise-level reliability, Zava needs to **migrate their existing Python-based temperature API to C#**. This migration will provide enhanced type safety through C#'s compile-time checking, improved performance with optimized runtime, and better scalability to handle the increased demand from retail market integration with enterprise-grade .NET infrastructure. The API currently provides historical weather data across multiple countries, cities, and months - data that's essential for Zava's smart fiber products to perform optimally in different environmental conditions.

This workshop will guide you through the complete migration process using GitHub Copilot, demonstrating how AI-assisted development can streamline the transition from Python to C# while maintaining full API compatibility and improving overall system robustness.

Let's go through some challenging requests for GitHub Copilot and address them
as they happen.

!!! note
    This repo is intended to give an introduction to various **GitHub Copilot** features, such as **Copilot Chat**, **inline chat** and **Agent Mode** within **Visual Studio Code**. Hence the step-by-step guides below contain the general description of what needs to be done, and Copilot can support you in generating the necessary commands.

    Each step (where applicable) also contains a `Cheatsheet / Tip` which can be used to validate the Copilot suggestion(s) against the correct command.

    💡 Play around with different prompts and see how it affects the accuracy of the GitHub Copilot suggestions. For example, when using inline chat, you can use an additional prompt to refine the response without having to rewrite the whole prompt.

## Workshop features

You will be working with a Python project that has an HTTP API. This project needs to be migrated and your main task will be to migrate it over using the C# programming language with .NET Minimal APIs.

Here are some features:

1. Run the web application and open up the browser
1. Use the /docs endpoint in the running app to see the endpoints
1. All dependencies and libraries are pre-installed for Python
1. Python tests are provided to validate correctness of both Python and C# implementations

## GitHub Copilot Modes

GitHub Copilot offers distinct modes: **Ask**, **Edit**, **Plan** and **Agent**, each designed to enhance your coding workflow in unique ways. These modes cater to different levels of assistance, from answering questions to autonomously managing complex tasks.

### Ask Mode

**Ask Mode** is a Q&A assistant that helps you understand code, solve problems or learn concepts. It allows you to ask questions in natural language, and Copilot responds with explanations, snippets or suggestions. It does not directly modify any code.

!!! tip
    Ask mode works best for quick clarifications, brainstorming solutions and providing sample implementations.

### Edit Mode

**Edit Mode** enables *direct code modifications* based on natural language instructions. You can highlight specific code blocks or files, describe the desired changes, and Copilot will propose edits. These changes are presented as diffs for your review, ensuring you retain control over the final implementation.

!!! tip
    Try Edit mode for targeted updates, such as refactoring or adding error handling. Most of the time, Agent mode is the preferred option over Edit mode for more complex tasks.

### Agent Mode

**Agent Mode** is the most autonomous and powerful of the three. It allows Copilot to analyze your entire project, plan tasks, make edits, run commands, and iterate until the goal is achieved. This mode is ideal for multi-step tasks, such as building features, fixing bugs, or scaffolding new components. While Agent mode automates much of the process, it still surfaces potentially risky actions for your approval, ensuring safety and correctness.

!!! tip
    Agent mode will carry out actions beyond just editing, such as writing code and creating new files. It is best used for tasks that involve more than just prompting for knowledge or editing single lines.

### Plan Mode

**Plan Mode** is a new feature in GitHub Copilot that allows users to outline their coding tasks and objectives more effectively. In this mode, Copilot assists in creating a structured plan for your coding project, helping you break down complex tasks into manageable steps. This can include generating boilerplate code, suggesting project structures, and even identifying potential challenges before you start coding.

!!! tip
    Use Plan Mode to enhance your workflow by setting clear objectives and receiving tailored suggestions for your project.

## Using File References in Prompts

When working with GitHub Copilot throughout this workshop, you'll encounter prompts that use the `#file:filename` syntax. This is an important pattern to understand:

!!! note
    In the prompts where a `#file:filename` is used, it indicates to Copilot the file where the code should be generated.
    You should manually type the `#` and select the file, and then copy and paste the rest of the prompt.
    This is useful when you have multiple files in your project and want to provide specific context to Copilot about which file you're working with.

## Available Models

This workshop is model-agnostic, and as such we do not require learners to select a specific one during their work. However, it is worth noting that GitHub Copilot supports a variety of models (such as GPT models, Claude models, Gemini models, etc.) of varying capabilities. To learn more about GitHub Copilot and its different plans, visit the **Resources** section or visit this link: [GitHub Copilot Plans](https://github.com/features/copilot/plans)
