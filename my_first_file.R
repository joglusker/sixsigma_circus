# Load libraries
library(gert)
library(credentials)

# Step 0: Set GitHub Personal Access Token
credentials::set_github_pat()  # Paste your PAT in the popup

# Step 1: Fetch remote branches so local knows about 'origin/main'
gert::git_fetch("origin")

# Step 2: Check if local 'main' branch exists
branches <- gert::git_branch_list()

if(!("main" %in% branches$name)) {
  # Create local 'main' branch from the remote
  gert::git_branch_create("main", checkout = TRUE, ref = "origin/main")
} else {
  # Local 'main' exists → switch to it
  gert::git_branch_checkout("main")
}

# Step 3: Pull latest changes from GitHub
gert::git_pull()

# Step 4: Stage all new or changed files
gert::git_add(dir(all.files = TRUE))

# Step 5: Commit all staged files
gert::git_commit_all("Add or update files")

# Step 6: Push changes to GitHub
gert::git_push()
