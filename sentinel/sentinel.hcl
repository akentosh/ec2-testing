policy "enforce-mandatory-tags" {
    enforcement_level = "hard-mandatory"
}

policy "require-private-acl-for-s3-buckets" {
    enforcement_level = "hard-mandatory"
}

policy "restrict-ec2-instance-type" {
    enforcement_level = "soft-mandatory"
}
