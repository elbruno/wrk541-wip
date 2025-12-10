Now that you have the scaffolding, you can start creating a single endpoint. Use Copilot to suggest the first pass for the `Program.cs` file that will hold your first endpoint. Ensure that Copilot understands that it shouldn't generate the whole file, but only the main `/` endpoint.

### 6. Create a single endpoint

- Open the `Program.cs` file and ask Copilot to generate *only* the `/` endpoint

!!! important
    You might be tempted to ask Copilot to generate the whole file, but you must validate each part as you make progress. It is easier to validate smaller parts than a whole file with multiple endpoints and logic.

!!! note
    In the prompts where a `#file:filename` is used, it indicates to Copilot the file where the code should be generated.
    You should manually type the `#` and the file selected, and then copy and paste the rest of the prompt.
    This is useful when you have multiple files in your project.

??? question "Tip"
    Prompt *(Agent Mode)*

    ```text
    #file:Program.cs add the root of the API only. This is the '/' endpoint, do not generate other endpoints yet, focus only on the single root endpoint for now.
    ```

The minimal code for the root endpoint should look like this:

```csharp
var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.MapGet("/", () => Results.Ok(new { message = "Welcome to the C# minimal API root." }))
   .WithName("Root");

app.Run();
```

### 7. Validate your first C# endpoint

Now that you have the first endpoint in C#, it is time to validate. This process of creating code and validating it is iterative and a solid practice when you need to develop a new project. It is even more crucial now that you are rewriting a project in a new language.

- Make sure the Python project is no longer running
- Ask Copilot help to run the C# project in the same address and port as the Python project so that tests can run
- Run the tests to ensure they are passing, fix any issues that arise

??? question "Tip"
    Prompt *(Agent Mode)*

    ```text
    Please stop any process on port `8000`, then start the C# minimal API in `src\csharp-app` with `ASPNETCORE_URLS=http://0.0.0.0:8000`. Do not change any C# code or tests.
    Start the C# app in the foreground in one terminal and open a second terminal to run the bash tests so they can execute while the app is running.
    In the second terminal, run `src/tests/test_endpoints.sh`. Only verify the `/` endpoint for now and report the test output.
    Use the workspace root and a shell.
    ```

### 8. Continue with all other endpoints

Use the same process as above to create all other endpoints. Add a single endpoint at a time, validate it, and run the tests.

!!! tip "When implementing the next endpoint - e.g. '/countries' - specify in your prompt to Copilot that it should use the same data used by the python app, hosted in the 'weather.json' file."

For the JSON file, you will need to deserialize it using `System.Text.Json`. If you aren't familiar with this process you will have to rely on Copilot guidance. Ensure that you generate the smallest possible code and validate it immediately.

!!! success "Validating smaller parts of the code is easier than validating a whole file. It is also easier to debug smaller parts of the code. This is a good practice when using GitHub Copilot and it will help you in the long run."
