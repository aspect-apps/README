#!/bin/bash

echo "Install all of the required dependancies for this setup"

npm install semantic-release@latest --save-dev
npm install husky@latest --save-dev
npm install lint-staged@latest --save-dev
npm install prettier --save-dev
npm install pinst --save-dev
npm install --save-dev @commitlint/{cli,config-conventional}

if [ "$1" == "-typescript" ]; then
    npm install typescript --save-dev
fi

echo "Adding a Github Actions semantic-release script"

mkdir -p .github/workflows/
echo '
name: Release
on:
  push:
    branches:
      - master
      - main
jobs:
  release:
    name: Release
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Setup Node.js
        uses: actions/setup-node@v1
        with:
          node-version: 12
      - name: Install dependencies
        run: npm ci
      - name: Release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
        run: npx semantic-release
' > .github/workflows/release.yml
echo '
  {
    "branches": ["master", "main", "next"]
  }
' > .releaserc.json

# Configure Husky

npx husky install
npx husky add .husky/commit-msg 'npx --no-install commitlint --edit $1'

if [ "$1" == "-typescript" ]; then
    echo "TypeScript flag has been detected: adding typescript compilation to pre-commit hook"

    npx husky add .husky/pre-commit '
        npm run pre-commit
        npx tsc
        git add .
    '
else
    npx husky add .husky/pre-commit 'npm run pre-commit'
fi

echo '
    {
        "src/**/*.{js,jsx,ts,tsx,json,css,scss,md}": [
            "prettier --write",
            "git add ."
        ]
    }
' > .lintstagedrc.json
npx npm-add-script -k prepublishOnly -v "pinst --disable"
npx npm-add-script -k postpublish -v "pinst --enable"
npx npm-add-script -k pre-commit -v "lint-staged"
npx npm-add-script -k postinstall -v "husky install"

# Configure Commitlint

echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js