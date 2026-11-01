# CLAUDE.md

The website of the CU Narrative Intelligence Lab, nil.columbia.edu: a Jekyll site with Tailwind
and PostCSS. A push to `main` runs a GitHub Actions workflow that deploys it, so **a push
publishes the site**.

- `_pages/`, `collections/`, `_data/`: the content (people, papers, news, projects).
- `_layouts/`, `_includes/`, `assets/`: layout, styling, scripts.
- `functions/proxy.js`, `CNAME`, `.github/workflows/jekyll.yml`: how the site is served and
  deployed. Do not change these unless I ask; the settings block editing the workflow and `CNAME`.
- `.env` is local and not committed. `_site/` and `.jekyll-cache/` are build output.

## Publishing

- Commit at logical chunks of finished work. **Never push without my yes**, each time, and run
  `git push` as a command by itself. Show me what changed first (`git diff origin/main --stat`).
- Check a change with `bundle exec jekyll build` (output stays in this folder). Previewing with
  `jekyll serve` I do myself, in my own terminal.
- A page that is wrong is public the moment it is pushed. Before a push, reread what you changed
  for anything I did not tell you to say.

## Content

- Everything on the site is public. Say nothing about unpublished work: no results, no corpus
  details, no manuscript titles or reviewer comments, no names of people who have not agreed to
  be listed. If a project's status is wanted, I give you the wording.
- Never invent a publication, venue, date, affiliation, or quotation. Take them from me or from
  the publisher's or an index's record, and check them there.
- Write copy only when I ask, and treat it as a draft for me to rewrite. Match the tone of the
  existing pages. Follow `.claude/` plus the machine-wide rules for the sandbox and for
  messages from `sys-admin`.

## Setup

- Ruby 3.3.6 through rbenv, gems in `~/gems`, Node for PostCSS. Installing or updating a gem or an
  npm package changes what the live site is built with: ask me first, and I will do it or widen
  the sandbox.
