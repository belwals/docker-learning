#!/bin/sh
#This script is created and manage by @Saurabh Belwal
#It takes care of generating ci/cd supported environment variables
# Tagging approach
# Pre-requisites Valid git repository
# Logic : to create tag
# if branch is main/master then based on last git commit timestamp it will create version using format i.e. yyyymmddhhmmss.<commit_hash>
# For feature branch (other than main/master) in format : yyyymmddhhmmss.<commit_hash>-<branch_name>

MASTER_BRANCH="master"
MAIN_BRANCH="main"
DEFAULT_VERSION="00000.0"
LAST_COMMIT_TSP=""

VERSION=$DEFAULT_VERSION
CURRENT_BRANCH=''
IS_TAGGING_NEED_TO_PERFORMED=false
VERBOSE=false
LAST_COMMIT_HASH=''


function help()  {
   echo "Usage: $0 "
   echo -e "\t tag| t if we want to tag current branch head"
    echo -e "\t help| h if we want to get uses"
    exit 1
}

function get_last_git_commits_timestamp() {
   LAST_COMMIT_TSP=$(git log -1 --format="%ai" 2>/dev/null || echo 'NOT_FOUND')
}

function identify_branch_name() {
   CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'NOT_FOUND')
}

function get_last_git_commits_hash() {
  LAST_COMMIT_HASH=$( git rev-parse --short HEAD 2>/dev/null || echo '')
}

function generate_new_version() {
   version=$(date -d "$LAST_COMMIT_TSP"  +'%Y%m%d%H%M%S')
   if [ $CURRENT_BRANCH == "main" ] || [ $CURRENT_BRANCH == "master" ] 
   then
      # echo "Performing things for master branch"
      VERSION=$version"."$LAST_COMMIT_HASH
   else 
      # echo "Performing things for feature branch"
      VERSION=$version"."$LAST_COMMIT_HASH"-"$CURRENT_BRANCH
   fi
}


function process_tagging_with_the_version() {
   echo "Starting tagging process, performing tag on branch: $CURRENT_BRANCH"
   $(git tag $VERSION)
   echo "Pushing a new tag to remote $VERSION"
   $(git push origin $VERSION)

}

function main() {
   echo "Process to generate a new version is started : $(date -d "$startTime"  +'%d/%m/%Y %H:%M:%S')"
   
   # Checking the branch status 
   identify_branch_name
   if [ $CURRENT_BRANCH == '' ] || [ $CURRENT_BRANCH == 'NOT_FOUND' ]
   then
      echo "ERROR::Unable to find branch, hence failing the process with error!!!!"
      exit 1
   fi   
   # echo "Branch is: $CURRENT_BRANCH"
   # Identifying the last commit timestamp to derive the version
   get_last_git_commits_timestamp

   get_last_git_commits_hash
   
   generate_new_version

   echo "Generated git version: $VERSION with tagging requirement : $IS_TAGGING_NEED_TO_PERFORMED"

   if [ $IS_TAGGING_NEED_TO_PERFORMED == true ] 
   then
      process_tagging_with_the_version "$VERSION"
   fi

   endTime=$(date)
   echo "Process to generate a new version is completed: $(date -d "$endTime"  +'%d/%m/%Y %H:%M:%S')"
}

#Parsing the supplied arguments
while [[ "$#" -gt 0 ]]; do
      case $1 in
          -t|--tag) IS_TAGGING_NEED_TO_PERFORMED="$2"; shift ;;
          -v|--verbose) VERBOSE="$2" ;;
          -h|--help) help ;;
          *) echo "Unknown parameter passed: $1"; exit 1 ;;
      esac
    shift
    done

#Performing main method to perform version generation operation
main
