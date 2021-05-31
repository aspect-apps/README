## README

Welcome to the Aspect Apps contribution documentation! Yes... documentation, at Aspect Apps we strive for streamlined systems, that includes documentation, no more and no less. If you are new here, then please read on how to contribute to both our internal and open-source projects.

### Open Source Contributors


To make a contribution to one of our open-source reepositories, clone the repo:

```sh
git clone https://github.com/aspect-apps/name-of-repo
```

After cloning the repository make the required changes and create a pull request in the parent repository. Make sure to update the `package.json` with a version patch, minor or major. We follow [Semantic Versioing](https://semver.org/) in all of our repositories.

Once the pull request is merged a Github action will be triggered and publish the version to NPM!
