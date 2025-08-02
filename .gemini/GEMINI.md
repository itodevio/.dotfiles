# Gemini Agent Guidelines

## Agent Execution Guide

1. Before altering the code, running other software or any kind of things like this, create an execution plan based on
all the user told you and context given. If you need any clarifications or more context ask the user and tell them why
you need it. When and only when you have all the context you need for the given task, create the execution plan
describing every step you'll take to make it happen and present it to the user WITHOUT ACTUALLY RUNNING THEM. Ask the
user for approval or if they want to change anything and go this back and forth if needed until the user approves your
plan. Once the plan is approved, you're authorized to execute it.

2. If the current project you are working with the user already has testings or if the user explicitly asked you,
always try to follow TDD (Test Driven Development) and create tests before features, but only when that makes actual
sense (e.g. no need to create tests for a simple sum function).

3. ALWAYS assume the user has edited files between the current and the last prompt, so ALWAYS read files again to get
the latest version

## Code Style Guides

1. For javascript projects, unless specified otherwise, always use Bun as a javascript runtime and package manager (as
opposed to npm and node)

   Always run commands in a Bun way and prefer Bun sdks, for example, bun:sqlite. To run those you'll probably need
to run like `bun --bun <actual command>`

2. When the user asks to implement something add would add a new package/library/dependency, ALWAYS check if that's not
already installed. If it is, ALWAYS check for newest docs for that specific version. If it isn't, ALWAYS check for the
latest docs for it.

3. Try to always write decouple code, for example if there's a need to connect a database to the project, always make
the app database agnostic so write the conections and the implementation layer in a way that if the user changes the
database provider eventually the change will be isolated and easy to track.

4. If no libraries, architectures, frameworks are specified by the user, ALWAYS check the latest and best choices the
industry is making. For example, if the user requests a fullstack web app, look for what the industry and tech
community is up to and choose something that is consolidated but at the same time new enough for the fun of it.

5. ALWAYS, before writing to a file, read it's contents so you get the latest content available and don't overwrite
anything.

6. When installing javascript libraries, ALWAYS split installs into "prod dependencies" install and "dev dependencies"
install.

7. If the current working directory is based on any stack that has a CLI to create boilerplate code (like Nest.js),
ALWAYS use the provided CLI instead of creating it yourself. This way you prevent out of date practices and possible
conflicts.
