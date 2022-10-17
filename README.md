# GitHub Action to Cherry-Pick PRs to a Target Branch
Github Action to cherry-pick any PR to a separate branch and create a new PR to the target branch.

> This project was inspired by [vendoo/gha-cherry-pick](https://github.com/vendoo/gha-cherry-pick).

## Installation
To configure the action simply add the following lines to your .github/workflows/cherry-pick.yml workflow file:

```yml
name: Cherry Pick On Comment
on:
  issue_comment:
    types: [created]

jobs:
  cherry-pick:
    name: Cherry Pick
    if: github.event.issue.pull_request != '' && contains(github.event.comment.body, '/cherry-pick')
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the latest code
        uses: actions/checkout@v2
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          fetch-depth: 0
      - name: Cherry Pick Action
        uses: tarfin-labs/cherry-pick-github-action@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

After installation simply add a comment `/cherry-pick <target_branch>` to the PR you wish to cherry-pick to trigger the action.

## Changelog
Please see [CHANGELOG](CHANGELOG.md) for more information on what has changed recently.

## Security Vulnerabilities
Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits
- [Turan Karatuğ](https://github.com/tkaratug)
- [All Contributors](../../contributors)

## License
The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
