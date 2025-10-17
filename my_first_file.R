# Load libraries
library(gert)
library(credentials)

# Step 0: Set GitHub Personal Access Token
credentials::set_github_pat()  # Paste your PAT in the popup

# Step 1: Check if local 'main' branch exists
branches <- gert::git_branch_list()

if(!("main" %in% branches$name)) {
  # No local 'main' → create it from remote
  gert::git_branch_create("main", checkout = TRUE, ref = "origin/main")
} else {
  # Local 'main' exists → switch to it
  gert::git_branch_checkout("main")
}

# Step 2: Pull latest changes from GitHub
gert::git_pull()

# Step 3: Stage all new or changed files
gert::git_add(dir(all.files = TRUE))

# Step 4: Commit all staged files
gert::git_commit_all("Add or update files")

# Step 5: Push changes to GitHub
gert::git_push()
