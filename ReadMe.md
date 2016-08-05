## Installation

From application root: `git submodule add https://github.com/lazuscripts/githook githook`<br>
Inside your application class: `@include "githook/githook"`

## Config

- `githook "branch"` must be set for the hook to do anything (will default to "master" if a
  non-string truthy value is used).
- `githook_secret "secret"` must be set with the secret for the hook.

Assumes you are using MoonScript and have `moonc` available. Will attempt to
compile all code after pulling, before updating the running server.
