# Contributing Guidelines

Contributions are welcome via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## Sign off Your Work

The Developer Certificate of Origin (DCO) is a lightweight way for contributors to certify that they wrote or otherwise have
the right to submit the code they are contributing to the project.
Here is the full text of the [DCO](http://developercertificate.org/).
Contributors must sign-off that they adhere to these requirements by adding a `Signed-off-by` line to commit messages.

```
This is my commit message

Signed-off-by: John Doe <john.doe@example.org>
```

See `git help commit`:

```
-s, --signoff
    Add Signed-off-by line by the committer at the end of the commit log
    message. The meaning of a signoff depends on the project, but it typically
    certifies that committer has the rights to submit this work under the same
    license and agrees to a Developer Certificate of Origin (see
    http://developercertificate.org/ for more information).
```

## How to Contribute

1. Fork this repository, develop, and test your changes
1. Remember to sign off your commits as described above
1. Submit a pull request

***NOTE***: In order to make testing and merging of PRs easier, please submit changes to multiple charts in separate PRs.

### pre-commit

This repo supports the [pre-commit](https://pre-commit.com) framework.
By installing the framework (see [docs](https://pre-commit.com/#install)) it is possible to perform the chart linting step before committing your code.
This can help prevent linter issues in the pipeline. Note that this requires having Docker running on your development environment.
