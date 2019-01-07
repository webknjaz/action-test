workflow "New workflow" {
  on = "push"
  resolves = ["re-actors/dpl-action@master"]
}

action "re-actors/dpl-action@master" {
  uses = "re-actors/dpl-action@master"
}
