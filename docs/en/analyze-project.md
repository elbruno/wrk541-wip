### 4. Strategize with GitHub Copilot

> *Try using GitHub Copilot in Ask Mode for this step.*

Now that you have a good understanding of the project, you can start strategizing with GitHub Copilot. Using **Ask Mode**, ask questions about why the tests might be a good idea when rewriting the project in C#.

- Ask GitHub Copilot to provide a summary of the tests

??? question "Tip"
    Prompt *(Ask Mode)*

    ```text
    #codebase provide a summary of the tests for the python application in this repository
    ```
??? question "Tip"
    Prompt *(Ask Mode)*

    ```text
    #codebase why are these tests using BASH a good idea if I want to rewrite the application from Python to C#?
    ```

- Ask for suggestions on how to properly rewrite this project in C#

!!! note
    Sometimes, GitHub Copilot may be eager to provide a lot of information including whole files with code. This is probably not what you want when trying to think about your options.
    Ensure you tell Copilot to avoid generating code when brainstorming and strategizing.

??? question "Tip"
    Prompt *(Ask Mode)*

    ```text
    #codebase do not change any code. Just provide suggestions on how to properly rewrite this project in C#
    ```

### 5. Identify missing tests

The tests are not complete and there are some missing cases. Use GitHub Copilot to identify the missing tests. This will help you get full coverage of the application before you start rewriting it in C#.

For this step, you must use **Agent Mode**.

- Open the test file and ask GitHub Copilot to identify missing tests
- Implement the missing tests
- Run the tests to ensure they are passing, fix any issues that arise

??? question "Tip"
    Prompt *(Agent Mode)*

    ```text
    Help me run the tests using the BASH file and check that they pass. In case of failure, help me address the failures to get the tests passing
    ```
