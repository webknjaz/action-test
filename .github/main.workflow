workflow "New workflow" {
  on = "push"
  resolves = [
    "re-actors/dpl-action@master",
  ]
}

action "re-actors/dpl-action@master" {
  uses = "re-actors/dpl-action@master"
  needs = ["re-actors/ansible-molecule-action@master"]
  args = "--provider=pages --github-token=$GITHUB_TOKEN"
  secrets = ["GITHUB_TOKEN"]
}

action "re-actors/ansible-molecule-action@master" {
  uses = "re-actors/ansible-molecule-action@master"
}
