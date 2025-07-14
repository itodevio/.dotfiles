# Gemini Agent Guidelines

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
