# mwienk/php-deployer

This repository contains the Dockerfile for the image that can be used to deploy PHP projects with https://deployer.org.
Contains the source version of Deployer and the recipes package.

Example use in .gitlab-ci.yml
```yaml
deploy:
  stage: deploy
  image: mwienk/php-deployer
  only:
    - tags
  before_script:
    - eval $(ssh-agent -s)
    - ssh-add <(echo "$SSH_PRIVATE_KEY")
    - mkdir -p ~/.ssh
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
  script:
    - dep deploy ${CI_ENVIRONMENT_NAME} --tag=$CI_COMMIT_REF_NAME
```