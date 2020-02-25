# match-prefix
Action to match a prefix of an Issue Comment

## Usage

```
jobs:
  match-prefix:
    runs-on: ubuntu-latest
    steps:
      - name: Match /test prefix
        uses: jcudit/match-prefix@v1.0.0
        with:
          prefix: '/run-acceptance-tests'
          acknowledge_on_match: true

  acceptance-tests:
    needs: match-prefix
    steps:
      - ...
```
