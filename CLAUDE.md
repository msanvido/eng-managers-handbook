# Engineering Managers Handbook - Assistant Guide

## Build Commands
- `./build.sh` - Build and serve Jekyll site locally (Docker-based)
- Site will be available at http://localhost:4000

## Project Structure
- Jekyll static site generator with just-the-docs theme
- Content written in Markdown (.md files)
- Configuration in _config.yml

## Content Guidelines
- Use proper Markdown syntax with Jekyll front matter
- Follow existing document structure and organization
- Use callouts for important information (note, warning, important)
- Include mermaid diagrams when visualizations are helpful

## Code Style
- Use kramdown Markdown syntax consistently
- Follow Jekyll conventions for layouts and includes
- Disable line numbers in code blocks
- Enable copy code button for code snippets

## Workflow
- Edit .md files directly to modify content
- Preview changes locally using build.sh
- Commit descriptive messages to main branch
- Site is deployed via GitHub Pages