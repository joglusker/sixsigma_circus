library(gert)
library(credentials)

# Step 0: Set your GitHub Personal Access Token
credentials::set_github_pat()  # paste your PAT in the popup

# Step 1: Make sure your local branch exists and tracks GitHub
gert::git_fetch("origin")  # get remote info

branches <- gert::git_branch_list()

if(!("main" %in% branches$name)) {
  # create local 'main' branch from remote
  gert::git_branch_create("main", checkout = TRUE, ref = "origin/main")
} else {
  # switch to main branch
  gert::git_branch_checkout("main")
}

# -------------------------------
# Now your original assignment code
# -------------------------------

# Pull most recent changes from GitHub
gert::git_pull() 

# Stage all new or edited files
gert::git_add(dir(all.files = TRUE)) 

# Commit the changes
gert::git_commit_all("my first commit") 

# Push the commit to GitHub
gert::git_push() 
