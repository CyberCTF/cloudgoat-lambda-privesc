# Upstream

| | |
| --- | --- |
| Project | CloudGoat (scenario `lambda_privesc`) |
| Repository | https://github.com/RhinoSecurityLabs/cloudgoat |
| Version | v2.5.0 |
| Commit | abf1ba8f5e47d7ced750fdfa025d51c99f1a43ed |
| Licence | BSD-3-Clause |

`app/` holds, from that commit and at their upstream paths, unchanged: CloudGoat's `LICENSE`,
`README.md` and the scenario folder `cloudgoat/scenarios/aws/lambda_privesc/`. The rest of CloudGoat (its
Python CLI and the other scenarios) is left out: the lab doesn't use it, and two other scenarios'
cheat sheets hold example AWS keys that GitHub's push protection refuses.

Isoloom applies the scenario's `terraform/` folder directly, with the
variables CloudGoat's Python CLI would pass (`profile`, a fixed `cgid`) in `isoloom.yml`. To
update, replace `app/` with a newer release and change this table.
