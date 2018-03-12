[![License](https://img.shields.io/github/license/plus3it/terraform-aws-bucket-keys.svg)](LICENSE)
[![Travis CI Build Status](https://travis-ci.org/plus3it/terraform-aws-bucket-keys.svg?branch=master)](https://travis-ci.org/plus3it/terraform-aws-bucket-keys)

# terraform-aws-bucket-keys
Terraform module that returns a list of object keys from an S3 bucket.

## Usage

```
module "bucket_keys" {
  source = "git::https://github.com/plus3it/terraform-aws-bucket-keys"

  bucket    = "bucket-example"
  prefix    = "s3key/prefix/"
  delimiter = ","
}
```

## Examples

*   [Basic Example][example1]

[example1]: https://github.com/plus3it/terraform-aws-bucket-keys/tree/master/examples/example1

## Requirements

This module uses an `external` data resource based on a custom python script
to retrieve the objects in the s3 bucket, [`list_s3_keys.py`](list_s3_keys.py).
You must have python installed and in the PATH to use this Terraform module.
The script also requires the packages in the [`requirements.txt`](requirements.txt)
file. Install them using `pip`:

```
pip install -r requirements.txt
```

## Authors

This module is managed by [Plus3IT Systems](https://github.com/plus3it).

## License

Apache 2 licensed. See [LICENSE](LICENSE.md) for details.
