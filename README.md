Welcome to the Aspect Apps contribution documentation! Yes... documentation, at Aspect Apps we strive for streamlined systems, that includes documentation, no more and no less. If you are new here, then please read on how to contribute to both our internal and open-source projects.

### Existing Open Source Contributors

To make a contribution to one of our open-source reepositories, clone the repo:

```sh
git clone https://github.com/aspect-apps/name-of-repo
```

After cloning the repository make the required changes and create a pull request to the parent repository. We follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification, this will be enforced with a pre-commit hook.

Once the pull request is merged a Github action will be triggered and publish the version to NPM (versioing based on the commit message)! All our repositories are powered via [Semantic Release](https://github.com/semantic-release/semantic-release).

### New Open Source Projects

If you are part of the Aspect Apps core team and want to create a new open source repository, there are a few steps you need to take. All our repositories require a set of technolgogies for automated release and linting, to make the setup easier you can run a script which will install all of the required packages.

- Firstly, create a new repository on Github (you will need to check that the name is available on NPM before you click "Creeate repository")

<img width="751" alt="Create New Repository on Github" src="https://user-images.githubusercontent.com/18139277/121162956-4c66bf00-c846-11eb-91f3-14f0df9178e8.png">

- Then run the following commands, to setup the repository (replace `react-native-scroll-headers` with the repository you created):

```sh
git clone https://github.com/aspect-apps/react-native-scroll-headers
cd ./react-native-scroll-headers
echo "# react-native-scroll-headers" >> README.md
git init
git remote add origin https://github.com/aspect-apps/react-native-scroll-headers.git
```
