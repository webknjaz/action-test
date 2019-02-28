workflow "Push workflow" {
  on = "push"
  resolves = [
    "Pyflakes action",
    "Check if unblocked",
    "Find Py syntax errors",
    "pycodestyle",
  ]
}

workflow "PR workflow" {
  on = "pull_request"
  resolves = [
    "hmarr/debug-action",
    "wip/action@master",
  ]
}

action "hmarr/debug-action" {
  uses = "hmarr/debug-action@master"
  env = {
    SOME = "VAR"
  }
}

action "datreeio/validate-license-action@master" {
  uses = "datreeio/validate-license-action@master"
  args = "MIT,ISC"
}

action "wip/action@master" {
  uses = "wip/action@master"
  needs = ["datreeio/validate-license-action@master"]
  secrets = ["GITHUB_TOKEN"]
}

action "pycodestyle" {
  uses = "andymckay/pycodestyle-action@master"
  needs = ["Check if unblocked"]
}

action "Find Py syntax errors" {
  uses = "cclauss/Find-Python-syntax-errors-action@master"
  needs = ["Check if unblocked"]
}

action "Pyflakes action" {
  uses = "lgeiger/pyflakes-action@master"
  needs = ["Check if unblocked"]
}

action "Check if unblocked" {
  uses = "nholden/modified-file-filter-action@master"
  args = "unblock_actions"
}
