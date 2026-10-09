# CloudGoat: Lambda privesc

[CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) by Rhino Security Labs: "vulnerable by
design" AWS deployment scenarios. This repository runs its `lambda_privesc` scenario with
[Isoloom](https://www.isoloom.com) in your own AWS account: [`isoloom.yml`](isoloom.yml) describes
the cloud services, the scenario sits unchanged in
[`app/`](app), and Isoloom applies the scenario's own
Terraform with the variables CloudGoat's Python CLI would pass.

| Cloud services | What |
| --- | --- |
| IAM | The user Chris and two roles (lambdaManager, debug) |

Cost while it runs: IAM only, nothing billed.

## Run it

Use an AWS account with nothing else in it, signed in with the AWS CLI (`aws login`, the
`default` profile, or set another with `-s cloud.vars.profile=<name>`), and Terraform installed.

```bash
isoloom run cloud-services
isoloom test cloud-services
isoloom down cloud-services
```

`run` prints where to start (your starting credentials, if the scenario gives you some). Guide:
the scenario's [README](app/cloudgoat/scenarios/aws/lambda_privesc/README.md) and cheat sheets in [`app/cloudgoat/scenarios/aws/lambda_privesc/`](app/cloudgoat/scenarios/aws/lambda_privesc).
Anything you create yourself while playing isn't Terraform's: delete it before `down`.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as CloudGoat ([LICENSE](LICENSE)). This lab is deliberately vulnerable: deploy it
only in an account you use for nothing else, and destroy it when you are done.
