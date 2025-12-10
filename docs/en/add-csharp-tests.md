# Adding C# tests

### 11. Finalizing the project with C# tests
Now that you have all the endpoints and tests passing, you can now use C# tests to validate the correctness. The shell tests were good enough to validate both Python and C# by using the HTTP API. But now you can use MSTest (or xUnit/NUnit) tests to validate the correctness of the C# project using its own tests.

- Ask Copilot where you can add tests for the C# project. Tests typically go in a separate test project (e.g., `WeatherApi.Tests`).
- Ask how to run the tests for validation
- Only add one test at a time and validate it. This is the same process as before and will help you concentrate on one thing at a time.

??? question "Tip"
    Prompt *(Agent Mode)*

    ```text
    Now that we have all endpoints in C# I want native C# unit tests using MSTest. 
    Create a test project so that I can verify correctness without having to use the BASH file
    ```

You should have a fully operating C# application that is well tested by now.
If you are reaching this point, congratulations! You can try achieving these
tasks before time runs out or try them on your own time later.