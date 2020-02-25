# match-prefix
Action to match a prefix of an Issue Comment

## Usage

```
jobs:

  match-prefix:
    runs-on: ubuntu-latest
    steps:
      - name: Match /run-acceptance-tests prefix
        id: match_prefix
        uses: jcudit/match-prefix@v1.0.0
        with:
          prefix: '/run-acceptance-tests'
      - name: Acknowledge on calling Issue
        uses: octokit/request-action@v1.1.0
        with:
          route: POST /repos/:owner/:repo/issues/${{ steps.match_prefix.outputs.issue_number }}/comments
          body: |
            👋 @${{ steps.match_prefix.outputs.issue_actor }} - Starting Action.
            Follow along on the [Actions tab](${{ steps.match_prefix.outputs.actions_url }}).
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  acceptance-tests:
    needs: match-prefix
    steps:
      - ...
```
