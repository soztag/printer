workflow "Publish" {
  on = "push"
  resolves = ["Deploy", "Convert"]
}

action "Convert" {
  uses = "maxheld83/pandoc@v0.1.1"
  env = {
    OUT_DIR = "public"
  }
  args = [
    "--standalone",
    "--output=public/index.html",
    "README.md"
  ]
}

action "Filter master" {
  needs = [
    "Convert"
  ]
  uses = "actions/bin/filter@a9036ccda9df39c6ca7e1057bc4ef93709adca5f"
  args = [
    "branch master"
  ]
}

action "Deploy" {
  needs = [
    "Filter master"
  ]
  uses = "maxheld83/rsync@v0.1.1"
  args = [
    "$GITHUB_WORKSPACE/public/", 
    "pfs400wm@karli.rrze.uni-erlangen.de:/proj/websource/docs/FAU/fakultaet/phil/www.datascience.phil.fau.de/websource/printer"
  ]
  env = {
    HOST_NAME = "karli.rrze.uni-erlangen.de"
    HOST_IP = "131.188.16.138"
    HOST_FINGERPRINT = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFHJVSekYKuF5pMKyHe1jS9mUkXMWoqNQe0TTs2sY1OQj379e6eqVSqGZe+9dKWzL5MRFpIiySRKgvxuHhaPQU4="
  }
  secrets = [
    "SSH_PRIVATE_KEY", 
    "SSH_PUBLIC_KEY"
  ]
}
