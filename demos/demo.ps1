# Instructions - website
git checkout master
Start-Process -FilePath https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/create-cmdline-predictor?view=powershell-7.3
Show-Slide -Slide $topics.Steps.Tooling
# Need to install dotnet sdk first
dotnet --list-sdks
# Create an empty class/ project using dotnet command
dotnet new classlib --name DemoPredictorPlus
git clean -fqd
git switch 01_empty_class
Set-Location -Path .\DemoPredictor
psedit .\DemoPredictor.cs, .\DemoPredictor.csproj
# We need to add a reference for SDK
git switch 02_checkout_dotnet
git diff 01_empty_class
# Time to define our predictor
Show-Slide -Slide $topics.Steps.Define
git switch 03_sample_predictor
psedit ..\module\DemoPredictor.psd1
# Building in VS Code
Show-Slide -Slide $topics.Steps.Build
git switch 04_build_module
psedit ..\.vscode\launch.json
psedit ..\.vscode\tasks.json
# Launching task - F5
# Next - build our own... sort-of ;)
git switch 05_making_it_work
# OK, now for reelz...
git switch 06_making_it_work_better
Start-Process -FilePath pwsh -ArgumentList @(
    '-NoExit'
    '-Command'
    'Import-Module -Name C:\Repos\DemoPredictor\module\DemoPredictor.psd1 -Force'
) -Wait
# Keep in mind - 20ms limit