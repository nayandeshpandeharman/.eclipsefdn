local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.ecsp', 'eclipse-ecsp') {
  settings+: {
    description: "",
    name: "Eclipse Connected Services Platform",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('ecsp-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "ECSP website",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.ecsp/sonarcloud.io/token-ecsp-website",
        },
      ],
    },
  ],
}
