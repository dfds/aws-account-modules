data "aws_iam_policy_document" "deny_deleting_cloudwatch_logs" {
  statement {
    sid    = "DenyDeletingCloudWatchLogs"
    effect = "Deny"
    actions = [
      "logs:DeleteLogGroup",
      "logs:DeleteLogStream",
      "logs:DeleteRetentionPolicy",
      "logs:DeleteMetricFilter",
      "logs:DeleteSubscriptionFilter",
      "logs:DeleteQueryDefinition",
      "logs:DeleteResourcePolicy",
    ]
    resources = ["*"]

    condition {
      test     = "ArnNotLike"
      variable = "aws:PrincipalArn"
      values   = ["arn:aws:iam::*:user/Deploy"]
    }
  }
}
