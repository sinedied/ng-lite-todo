# 🪶 ng-lite-todo

> Todo-list app built with (minimal) Angular.

An upcoming article detailing all the steps to build this app is coming soon!

<!-- See this [dev.to article](WIP) to see all details about how this app was created. -->

## Tasks

This project works the same way as any Angular project, by using either the included NPM scripts or the Angular CLI directly:

- `npm start`: run dev server at `http://localhost:4200/`
- `npm run build`: build the project in the `dist/` directory.

## Deploying on Azure

You need an [Azure account](https://azure.microsoft.com/free/?WT.mc_id=javascript-0000-yolasors), [Azure CLI](https://aka.ms/tools/azure-cli) and [GitHub CLI](https://cli.github.com) installed.
If you're using Windows, you'll also either need to use [WSL](https://docs.microsoft.com/windows/wsl/install?WT.mc_id=javascript-0000-yolasors) or [Git Bash](https://git-scm.com/downloads) to run the scripts.

1. Run `.azure/setup.sh`, and follow the instructions. At the end of the process, the first deployment will be triggered.

Now every time you make a commit to the repository, the project will be automatically redeployed to Azure using [GitHub Actions](https://github.com/features/actions).

If you want to clean up everything and delete the deployed resources, run `.azure/setup.sh --terminate`.
