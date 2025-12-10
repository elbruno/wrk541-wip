# Create C# Scaffolding

> *You should use GitHub Copilot in Agent Mode for this step and onwards.*

Now that you have a good understanding of the project and its tests, you can start creating the C# scaffolding. You will start by creating a special file with instructions. This file is called _Copilot Instructions_ and it should live in the root of the current repository. We've pre-created an empty file for you so all that is needed is to fill it out with new instructions.

For this step, open the `.github/copilot-instructions.md` file and add the
following:

```markdown
Whenever you are providing suggestions for a C# project always use the
ASP.NET Core Minimal APIs framework using System.Text.Json for serialization
and Swashbuckle for Swagger/OpenAPI documentation
```

??? warning 
     Creating a new instance of chat at this point can prove useful. It will clear some of the previous context and allow for GitHub Copilot to start fresh. If you wish to do so, all you need to do is click the ![New Chat Button on GitHub Copilot](./media/copilot-newchat.png) button at the top of Copilot's chat window.

As we will carry out a more complex set of tasks, we will move on from **Edit Mode** and solely work in **Agent Mode**. Once you have switched, ask GitHub Copilot to create the scaffolding necessary for your C# project. Ask GitHub Copilot to give you a step by step to start the project and the commands to run to get started.

??? question "Tip"
     Prompt *(Agent Mode)*

     ```text
     #file:csharp-app create the C# scaffolding in csharp-app folder, where we are going to migrate the python project. Use .NET Minimal APIs. Don't perform any code migration for now. Provide me with guided steps to run the project afterwards.
     ```

The framework and the serializer should automatically be included without you having to specify it. This file can be used for any other instruction you don't want to repeat.

Once GitHub Copilot has created the scaffolding, have a look at the files created in the `csharp-app` folder. You should see a `.csproj` file and a `Program.cs` file.
Ask GitHub Copilot to clarify any doubts you might have about the files created and their purpose.
