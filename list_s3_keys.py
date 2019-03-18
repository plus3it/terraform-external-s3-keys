# -*- coding: utf-8 -*-
"""Extends urllib with additional handlers."""
from __future__ import (absolute_import, division, print_function,
                        unicode_literals, with_statement)

import argparse
import json
import sys

import boto3


def keys_from_bucket_objects(objects):
    """Extract keys from a list of S3 bucket objects."""
    return [x["Key"] for x in objects if not x["Key"].endswith("/")]


def list_s3_keys(bucket_name, prefix='/', delimiter='/', start_after=''):
    """List S3 Keys."""
    s3_paginator = boto3.client('s3').get_paginator('list_objects_v2')
    prefix = prefix[1:] if prefix.startswith(delimiter) else prefix
    start_after = (
      (start_after or prefix) if prefix.endswith(delimiter) else start_after
    )
    for page in s3_paginator.paginate(
        Bucket=bucket_name, Prefix=prefix, StartAfter=start_after
    ):
        for content in page.get('Contents', ()):
            yield content['Key']


def main(bucket, prefix="", delimiter=","):
    """Return dictionary of delimited keys."""
    keys = list_s3_keys(bucket, prefix=prefix)
    return {"keys": delimiter.join(keys)}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "json", type=argparse.FileType("r"), default=sys.stdin,
        help="Parses BUCKET, PREFIX, and DELIMITER from a json file or stdin"
    )

    args = parser.parse_args()

    json_args = {}
    with args.json as fp_:
        json_args = json.load(fp_)

    sys.exit(print(json.dumps(main(**json_args))))
