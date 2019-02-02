# My-Deploy-Environment

Start a docker container with an own image

If I have a push, update the code in the docker container

--------------------------------
Steps:

1 - bash ./bootstrap.sh -i [ Create docker image running on port 9000 ]

2 - bash ./bootstrap.sh -c  [ Run or Create docker container, depends on step 1 ]

3(optional) - bash ./bootstrap.sh -d  [ Delete all docker images and containers ]

------------------------------------------------------------------------------------

 * `bootstrap.sh` (Create image docker, Container or delete the image and container)
 * `config.sh` (configuration of remote git and others)
 * `config.sh-sample` (sample of config.sh)
 * `Dockerfile` (Dockerfile of custom docker image)
 * `my-app/` (Folder of app, for development, example of app with express)
    * `index.js` (main js file)
    * `package.json` (package.json)
    * `package-lock.json` (package-lock.json)
 * `my-git-hooks/` (Folder of hooks that will called on git executions)
    * `pre-push` (is the hook that will be called when push command executed)
 * `my-scripts/` (Scripts folder by funcionality)
    * `create-docker-image.sh` (Responsible for the docker image build)
    * `create-git-deploy-request-docker.sh` (Script that will be executed in the docker container to update after push)
    * `create-git-deploy-request.sh` (Script called when git push is called)
    * `create-hooks.sh` (Script responsible to create git hooks inside .git/hooks)
    * `create-run-docker-container.sh` (Create docker container or start)
    * `delete-all-containers-images.sh` (Delete all containers and images)
 * `README.md` (Readme)
--------------------------------