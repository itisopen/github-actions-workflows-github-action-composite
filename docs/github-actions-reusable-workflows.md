<!-- markdownlint-disable -->
## Workflows

| Name | Description |
|------|-------------|
| [Features branch (Pull request) workflow ](#features-branch-pull-request-workflow) | Perform CI - lint `action.yml` and run tests  |
| [Main branch workflow](#main-branch-workflow) | Lint `action.yml`, run tests and draft release |
| [Release workflow ](#release-workflow) | ``` |




## Features branch (Pull request) workflow 

Perform CI - lint `action.yml` and run tests 

### Usage 

Create in your repo  __`.github/workflows/feature.yaml`__

```yaml
  name: Feature branch
  on:
    pull_request:
      branches: [ main ]
      types: [opened, synchronize, reopened]

  jobs:
    perform:
      uses: itisopen/github-actions-workflows-github-action-composite/.github/workflows/feature-branch.yml@itisopen
      with:
        organization: "${{ github.event.repository.owner.login }}"
        repository: "${{ github.event.repository.name }}"
        ref: "${{ github.event.pull_request.head.ref  }}"
```



### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| organization | Repository owner organization (ex. acme for repo acme/example) | string | ${{ github.event.repository.owner.login }} | false |
| ref | The fully-formed ref of the branch or tag that triggered the workflow run | string | ${{ github.event.pull\_request.head.ref }} | false |
| repository | Repository name (ex. example for repo acme/example) | string | ${{ github.event.repository.name }} | false |
| tests-prefix | Workflows file name prefix to run as tests | string | test-\* | false |








## Main branch workflow

Lint `action.yml`, run tests and draft release

### Usage 

Create in your repo  __`.github/workflows/main.yaml`__

```yaml
  name: Main branch
  on:
    push:
      branches: [ main ]

  permissions:
    contents: write

  jobs:
    perform:
      uses: itisopen/github-actions-workflows-github-action-composite/.github/workflows/main-branch.yml@itisopen
      with:
        organization: "${{ github.event.repository.owner.login }}"
        repository: "${{ github.event.repository.name }}"
```



### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| organization | Repository owner organization (ex. acme for repo acme/example) | string | ${{ github.event.repository.owner.login }} | false |
| publish | Whether to publish a new release immediately | string | true | false |
| ref | The fully-formed ref of the branch or tag that triggered the workflow run | string | ${{ github.ref }} | false |
| repository | Repository name (ex. example for repo acme/example) | string | ${{ github.event.repository.name }} | false |
| tests-prefix | Workflows file name prefix to run as tests | string | test-\* | false |








## Release workflow 

```



### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| organization | Repository owner organization (ex. acme for repo acme/example) | string | ${{ github.event.repository.owner.login }} | false |
| repository | Repository name (ex. example for repo acme/example) | string | ${{ github.event.repository.name }} | false |
| version | Release version tag | string | ${{ github.event.release.tag\_name }} | false |







<!-- markdownlint-restore -->
