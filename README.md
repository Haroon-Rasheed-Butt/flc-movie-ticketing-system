# Movie Ticketing System

End-to-end coursework project that demonstrates how a simple cinema ticketing workflow can be delivered with a Spring Boot + MySQL backend and an Angular front end. The repository is structured as a mono-root with Git submodules so that the backend and frontend applications can evolve independently while sharing a single history for deployment and grading.

## Repository Layout

- `Backend-Java/` *(submodule)* – Spring Boot service that exposes account, movie, cart, rating, and checkout endpoints. It ships with Docker support, schema/data SQL files, and Postman collections.
- `Frontend-Angular/` *(submodule)* – Angular client that consumes the backend APIs, implements the student-facing UI, Cypress tests, and Docker assets for nginx hosting.
- `movie_ticketing_schema.sql`, `Todo-Requirements.md`, and project-level documentation live in the root to make it easy to reference requirements without entering each submodule.

Working with Git submodules means each nested project has its own `.git` directory. When you clone this repo for the first time, make sure to pull the nested code too:

```bash
git clone <repo-url>
cd MovieTicketingSystem
git submodule update --init --recursive
```

If new commits land in either the backend or frontend, you can pull them with:

```bash
git submodule update --remote --merge Backend-Java
git submodule update --remote --merge Frontend-Angular
```

That command checks out the referenced branch (default `main`) for each submodule and merges the upstream changes into your local working copy. After reviewing, commit the updated submodule pointers in the root repository:

```bash
git commit Backend-Java Frontend-Angular -m "chore: bump submodules"
```

## Branching and Collaboration

Each submodule keeps its own branch strategy. Typical student workflow:

1. Create or switch to a feature branch inside the submodule directory, e.g. `cd Backend-Java && git checkout -b feature/auth`.
2. Implement and commit changes within that submodule.
3. Return to the root repo and commit the submodule pointer update so reviewers can pull the exact state you tested.

When you need to rebase or sync with upstream, always update the submodule first, test, then commit the pointer:

```bash
cd Frontend-Angular
git fetch origin
git rebase origin/main
cd ..
git add Frontend-Angular
git commit -m "chore: rebase frontend"
```

Keeping this order prevents detached HEAD issues and ensures CI/CD pipelines see the same versions you do locally.

## Getting Started Quickly

1. Run `git submodule update --init --recursive` after cloning.
2. Follow the README inside `Backend-Java` to spin up the API (Docker compose available).
3. Follow the README inside `Frontend-Angular` to install dependencies and start the Angular dev server.
4. Use the shared `.env` samples and docker-compose in each submodule if you need a full stack in one command.

Questions, improvements, or bug reports can be filed in this root repo. Please mention which submodule you touched so maintainers can triage faster.
